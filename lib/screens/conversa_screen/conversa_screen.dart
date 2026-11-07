import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ola_messenger/model/conversa.dart';
import 'package:ola_messenger/model/mensagem.dart';
import 'package:ola_messenger/model/status_mensagem.dart';
import 'package:ola_messenger/model/usuario.dart';
import 'package:ola_messenger/model/usuario_conversa.dart';
import 'package:ola_messenger/screens/conversa_screen/mensagem_tile.dart';
import 'package:ola_messenger/storage/storage.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class ConversaScreen extends StatefulWidget {
  final Usuario destinatario;
  const ConversaScreen({super.key, required this.destinatario});

  @override
  State<ConversaScreen> createState() => _ConversaScreenState();
}

class _ConversaScreenState extends State<ConversaScreen> {
  TextEditingController mensagemController = TextEditingController();
  Conversa? conversaAnterior;
  bool? conversaNova;
  String? idConversa;
  String? idRemetente;
  late final Storage storage;
  bool enviandoMensagemLocal = false;

  Stream<QuerySnapshot<Map<String, dynamic>>>? streamMensagensNuvem;
  Stream<List<Mensagem>>? streamMensagensLocal;

  StreamSubscription<QuerySnapshot<Map<String, dynamic>>>?
  subscriptionMensagensNuvem;

  StreamSubscription<List<Mensagem>>? subscriptionMensagensLocal;

  List<Mensagem> listaMensagensConversa = [];

  @override
  void initState() {
    super.initState();

    storage = context.read<Storage>();

    idRemetente = storage.pegarUsuario()!.uid;

    Future.microtask(() async {
      try {
        conversaAnterior = await buscarConversaAnterior();

        if (!mounted) return;

        if (conversaAnterior != null) {
          idConversa = conversaAnterior!.idConversa;
          conversaNova = false;
        } else {
          idConversa = gerarIdConversa();
          conversaNova = true;
        }

        print('resultado idConversa: $idConversa');

        streamMensagensNuvem = storage.abrirStreamMensagensPorIdConversa(
          idConversa!,
        );

        subscriptionMensagensNuvem = streamMensagensNuvem!.listen((
          event,
        ) async {
          final documentos = event.docChanges;
          for (final documento in documentos) {
            final dado = documento.doc.data();
            switch (documento.type) {
              case DocumentChangeType.added:
                if (dado == null || dado['idRemetente'] == idRemetente)
                  continue;
                await storage.adicionarOuAtualizarMensagemNuvemParaLocal(
                  Mensagem.fromMap(dado),
                );
                break;
              case DocumentChangeType.modified:
                if (dado == null || dado['idRemetente'] == idRemetente)
                  continue;
                await storage.adicionarOuAtualizarMensagemNuvemParaLocal(
                  Mensagem.fromMap(dado),
                );
                break;
              case DocumentChangeType.removed:
                if (dado == null || dado['idRemetente'] == idRemetente)
                  continue;
                await storage.removerMensagemLocal(Mensagem.fromMap(dado));
                break;
            }
          }
        });
        streamMensagensLocal = storage.abrirStreamMensagensLocal(idConversa!);

        subscriptionMensagensLocal = streamMensagensLocal!.listen((mensagens) {
          if (!mounted) return;
          setState(() {
            listaMensagensConversa = mensagens;
          });
        });

        if (!mounted) return;
      } catch (e) {
        debugPrint('Erro ao inicializar conversa: $e');
      }
    });
  }

  @override
  void dispose() {
    mensagemController.dispose();
    subscriptionMensagensLocal?.cancel();
    subscriptionMensagensNuvem?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.destinatario.nome)),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) =>
                  MensagemTile(mensagem: listaMensagensConversa[index]),
              itemCount: listaMensagensConversa.length,
            ),
          ),
          Row(
            children: [
              Expanded(child: TextFormField(controller: mensagemController)),
              IconButton(
                onPressed: () {
                  enviarMensagem();
                },
                icon: Icon(Icons.send_rounded, color: Colors.green),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> enviarMensagem() async {
    if (conversaNova == null) return;
    if (enviandoMensagemLocal == true) return;

    final texto = mensagemController.text.trim();
    if (texto.isEmpty) return;
    String idMensagem = const Uuid().v4();
    Mensagem mensagem = Mensagem(
      idMensagem: idMensagem,
      texto: mensagemController.text,
      idConversa: idConversa!,
      horarioEnvio: DateTime.now(),
      sincronizado: false,
      statusMensagem: StatusMensagem.pendente,
      idRemetente: storage.pegarUsuario()!.uid,
    );

    try {
      enviandoMensagemLocal = true;
      if (conversaNova == true) {
        await adicionarConversaLocal();
        await adicionarUsuarioConversaLocal();
        await adicionarMensagemLocal(mensagem);

        conversaNova = false;
      } else {
        await adicionarMensagemLocal(mensagem);
      }
      mensagemController.clear();
    } catch (e) {
      debugPrint('Erro ao enviar mensagem: $e');
      return;
    } finally {
      enviandoMensagemLocal = false;
    }

    try {
      mensagem.sincronizado = true;

      await storage.adicionarMensagemNuvem(mensagem);

      mensagem.statusMensagem = StatusMensagem.enviada;
      await storage.adicionarOuAtualizarMensagemNuvemParaLocal(mensagem);
    } catch (e) {
      mensagem.sincronizado = false;
      print('erro ao enviar mensagem para a nuvem: $e');
    }
  }

  String gerarIdConversa() {
    return const Uuid().v4();
  }

  Future<void> adicionarUsuarioConversaLocal() async {
    User? user = storage.pegarUsuario();
    final usuarioConversaRemetente = UsuarioConversa(
      idUsuario: user!.uid,
      idConversa: idConversa!,
      sincronizado: false,
    );
    final usuarioConversaDestinatario = UsuarioConversa(
      idUsuario: widget.destinatario.idUsuario,
      idConversa: idConversa!,
      sincronizado: false,
    );
    await storage.adicionarUsuarioConversaLocal(usuarioConversaRemetente);
    await storage.adicionarUsuarioConversaLocal(usuarioConversaDestinatario);
  }

  Future<void> adicionarConversaLocal() async {
    await storage.adicionarConversaLocal(
      Conversa(isGrupo: false, idConversa: idConversa!, sincronizado: false),
    );
  }

  Future<void> adicionarMensagemLocal(Mensagem mensagem) async {
    await storage.adicionarMensagemLocal(mensagem);
  }

  Future<Conversa?> buscarConversaAnterior() async {
    final user = storage.pegarUsuario();

    if (user == null) {
      throw StateError('Usuário não autenticado');
    }

    return await storage.pegarConversaEntreDoisUsuariosLocal(
      user.uid,
      widget.destinatario.idUsuario,
    );
  }

  Future<List<Mensagem>> buscarMensagemConversa() async {
    if (idConversa != null) {
      return await storage.buscarListaMensagensPorConversa(idConversa!);
    } else {
      return [];
    }
  }
}
