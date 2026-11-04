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

  List<Mensagem> listaMensagensConversa = [];

  @override
  void initState() {
    super.initState();

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

        final mensagens = await buscarMensagemConversa();

        if (!mounted) return;

        setState(() {
          listaMensagensConversa = mensagens;
        });
      } catch (e) {
        debugPrint('Erro ao inicializar conversa: $e');
      }
    });
  }

  @override
  void dispose() {
    mensagemController.dispose();
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
                  String idMensagem = const Uuid().v4();
                  Mensagem mensagem = Mensagem(
                    idMensagem: idMensagem,
                    texto: mensagemController.text,
                    idConversa: idConversa!,
                    horarioEnvio: DateTime.now(),
                    sincronizado: false,
                    statusMensagem: StatusMensagem.pendente,
                    idRemetente: context.read<Storage>().pegarUsuario()!.uid,
                  );
                  enviarMensagem(mensagem);
                },
                icon: Icon(Icons.send_rounded, color: Colors.green),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> enviarMensagem(Mensagem mensagem) async {
    if (conversaNova == null) return;

    final texto = mensagemController.text.trim();
    if (texto.isEmpty) return;

    listaMensagensConversa.add(mensagem);
    setState(() {});

    try {
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
    } finally {}

    try {
      mensagem.statusMensagem = StatusMensagem.enviada;
      if (!mounted) return;
      context.read<Storage>().adicionarMensagemNuvem(mensagem);
    } catch (e) {
      print('erro ao enviar mensagem para a nuvem: $e');
    } finally {
      setState(() {});
    }
  }

  String gerarIdConversa() {
    return const Uuid().v4();
  }

  Future<void> adicionarUsuarioConversaLocal() async {
    User? user = context.read<Storage>().pegarUsuario();
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
    await context.read<Storage>().adicionarUsuarioConversaLocal(
      usuarioConversaRemetente,
    );
    await context.read<Storage>().adicionarUsuarioConversaLocal(
      usuarioConversaDestinatario,
    );
  }

  Future<void> adicionarConversaLocal() async {
    await context.read<Storage>().adicionarConversaLocal(
      Conversa(isGrupo: false, idConversa: idConversa!, sincronizado: false),
    );
  }

  Future<void> adicionarMensagemLocal(Mensagem mensagem) async {
    await context.read<Storage>().adicionarMensagemLocal(mensagem);
  }

  Future<Conversa?> buscarConversaAnterior() async {
    final user = context.read<Storage>().pegarUsuario();

    if (user == null) {
      throw StateError('Usuário não autenticado');
    }

    return await context.read<Storage>().pegarConversaEntreDoisUsuariosLocal(
      user.uid,
      widget.destinatario.idUsuario,
    );
  }

  Future<List<Mensagem>> buscarMensagemConversa() async {
    if (idConversa != null) {
      return await context.read<Storage>().buscarMensagensPorIdConversa(
        idConversa!,
      );
    } else {
      return [];
    }
  }
}
