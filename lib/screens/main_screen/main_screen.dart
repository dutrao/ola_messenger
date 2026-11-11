import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ola_messenger/model/conversa.dart';
import 'package:ola_messenger/model/mensagem.dart';
import 'package:ola_messenger/model/status_mensagem_destinatario.dart';
import 'package:ola_messenger/model/usuario.dart';
import 'package:ola_messenger/model/usuario_conversa.dart';
import 'package:ola_messenger/screens/home_screen/home_screen.dart';
import 'package:ola_messenger/screens/perfil_screen/perfil_screen.dart';
import 'package:ola_messenger/storage/storage.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late final Storage storage;
  late final Storage  storageEstado;
  StreamSubscription? subscriptionConversaNuvem;
  StreamSubscription? subscriptionMensagemNuvem;
  StreamSubscription? subscriptionUsuarioConversaNuvem;
  StreamSubscription? subscriptionStatusMensagemDestinatarioNuvem;

  @override
  void initState() {
    super.initState();
    storageEstado = context.watch<Storage>();
    storage = context.read<Storage>();
    Future.microtask(() async {
      await storage.sincronizarUsuarioNuvemParaLocal();
      await storage.atualizarListaTodosUsuarios();
      subscriptionUsuarioConversaNuvem = storage
          .abrirStreamUsuarioConversaNuvem(storage.pegarUsuario()!.uid)
          .listen((event) async {
            storageEstado.listaIdConversasUsuarioNuvem = event.docs.map((e) => e.data()['idConversa'].toString(),).toList();
            for (final change in event.docChanges) {
              if (change.type == DocumentChangeType.added) {
                final usuarioConversa = UsuarioConversa.fromMap(
                  change.doc.data()!,
                );
                await storage.adicionarUsuarioConversaLocal(usuarioConversa);
              } else if (change.type == DocumentChangeType.modified) {
                final usuarioConversa = UsuarioConversa.fromMap(
                  change.doc.data()!,
                );
                await storage.adicionarOuAtualizarUsuarioConversaLocal(
                  usuarioConversa,
                );
              } else if (change.type == DocumentChangeType.removed) {
                final usuarioConversa = UsuarioConversa.fromMap(
                  change.doc.data()!,
                );
                await storage.removerUsuarioConversaLocal(usuarioConversa);
              }
            }
          });
      subscriptionConversaNuvem = storage
          .abrirStreamConversaNuvem(storageEstado.listaIdConversasUsuarioNuvem)
          .listen((event) async {            
            for (final change in event.docChanges) {
              if (change.type == DocumentChangeType.added) {
                final conversa = Conversa.fromMap(change.doc.data()!);
                await storage.adicionarConversaLocal(conversa);
              } else if (change.type == DocumentChangeType.modified) {
                final conversa = Conversa.fromMap(change.doc.data()!);
                await storage.adicionarOuAtualizarConversaLocal(conversa);
              } else if (change.type == DocumentChangeType.removed) {
                final conversa = Conversa.fromMap(change.doc.data()!);
                await storage.removerConversaLocal(conversa);
              }
            }
          });

      subscriptionMensagemNuvem = storage
          .abrirStreamMensagensPorListaIdConversa(storageEstado.listaIdConversasUsuarioNuvem)
          .listen((event) async {
            storageEstado.listaIdMensagensUsuarioNuvem = event.docs.map((e) => e.data()['idMensagem'].toString(),).toList();
            for (final change in event.docChanges) {
              if (change.type == DocumentChangeType.added) {
                final mensagem = Mensagem.fromMap(change.doc.data()!);
                await storage.adicionarMensagemLocal(mensagem);
              } else if (change.type == DocumentChangeType.modified) {
                final mensagem = Mensagem.fromMap(change.doc.data()!);
                await storage.adicionarOuAtualizarMensagemLocal(mensagem);
              } else if (change.type == DocumentChangeType.removed) {
                final mensagem = Mensagem.fromMap(change.doc.data()!);
                await storage.removerMensagemLocal(mensagem);
              }
            }
          });

      subscriptionStatusMensagemDestinatarioNuvem = storage
          .abrirStreamStatusMensagemDestinatarioNuvem(listaIdMensagens)
          .listen((event) async {
            for (final change in event.docChanges) {
              if (change.type == DocumentChangeType.added) {
                final statusMensagemDestinatario =
                    StatusMensagemDestinatario.fromMap(change.doc.data()!);

                await storage.adicionarStatusMensagemDestinatarioLocal(
                  statusMensagemDestinatario,
                );
              } else if (change.type == DocumentChangeType.modified) {
                final statusMensagemDestinatario =
                    StatusMensagemDestinatario.fromMap(change.doc.data()!);

                await storage
                    .adicionarOuAtualizarStatusMensagemDestinatarioLocal(
                      statusMensagemDestinatario,
                    );
              } else if (change.type == DocumentChangeType.removed) {
                final statusMensagemDestinatario =
                    StatusMensagemDestinatario.fromMap(change.doc.data()!);

                await storage.removerStatusMensagemDestinatarioLocal(
                  statusMensagemDestinatario,
                );
              }
            }
          });
      print("numero usuarios local: ${storage.listaTodosUsuarios.length}");
    });
  }

  @override
  dispose() {
    subscriptionConversaNuvem?.cancel();
    subscriptionMensagemNuvem?.cancel();
    subscriptionUsuarioConversaNuvem?.cancel();
    subscriptionStatusMensagemDestinatarioNuvem?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Usuario> listaTodosUsuarios = storage.listaTodosUsuarios;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
          BottomNavigationBarItem(icon: Icon(Icons.logout), label: "Sair"),
        ],
        onTap: (value) {
          switch (value) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      HomeScreen(listaTodosUsuarios: listaTodosUsuarios),
                ),
              );
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PerfilScreen()),
              );
            case 2:
              context.read<Storage>().deslogar();
          }
        },
      ),
      appBar: AppBar(title: Text("Olá Messenger")),
      body: HomeScreen(listaTodosUsuarios: listaTodosUsuarios),
    );
  }
}
