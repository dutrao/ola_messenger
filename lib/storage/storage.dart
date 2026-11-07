import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ola_messenger/database/database.dart';
import 'package:ola_messenger/model/conversa.dart';
import 'package:ola_messenger/model/mensagem.dart';
import 'package:ola_messenger/model/status_mensagem_destinatario.dart';
import 'package:ola_messenger/model/usuario.dart';
import 'package:ola_messenger/model/usuario_conversa.dart';
import 'package:ola_messenger/repository/repository.dart';

class Storage extends ChangeNotifier{
  AppDatabase database;  
  late Repository repository = Repository(database: database);

  Storage({required this.database});

  ////Variaveis de estado
  
  List<Usuario> listaTodosUsuarios = [];

  Future<void> fazerLogin(String email, String senha)async{
   await repository.fazerLogin(email, senha);   
  }

  Future<void> criarConta(String email, String senha)async{
   await repository.criarConta(email, senha);
  }

  Future<void> deslogar()async{
    await repository.deslogar();
  }

  User? pegarUsuario(){
   return repository.pegarUsuario();
  }

  ////FUNÇÕES RELACIONADAS A USUARIO
  Future<void> adicionarUsuarioLocal(Usuario usuario)async{
    await repository.adicionarUsuarioLocal(usuario); 
  }

  Future<void> adicionarUsuarioNuvem(Usuario usuario)async{
    await repository.adicionarUsuarioNuvem(usuario);
  }

  Future<List<Usuario>> pegarListaUsuarios()async{
    return await repository.pegarListaUsuarios();
  }

  Future<void> atualizarListaTodosUsuarios()async{
    listaTodosUsuarios = await repository.pegarListaUsuarios();
    notifyListeners();
  }

  ////FUNÇÕES RELACIONADAS A USUARIOCONVERSA  
  Future<void> adicionarUsuarioConversaLocal(UsuarioConversa usuarioConversa)async{
    await repository.adicionarUsuarioConversaLocal(usuarioConversa);
  }

  Future<Conversa?> pegarConversaEntreDoisUsuariosLocal(String idUsuario01, String idUsuario02)async{
    return await repository.pegarConversaEntreDoisUsuariosLocal(idUsuario01, idUsuario02);
  }

  ////FUNÇÕES RELACIONADAS A CONVERSA
  Future<void> adicionarConversaLocal(Conversa conversa)async{
    await repository.adicionarConversaLocal(conversa);
  }

  ////FUNÇÕES RELACIONADAS A MENSAGEM
  Future<void> adicionarMensagemLocal(Mensagem mensagem)async{
    await repository.adicionarMensagemLocal(mensagem);
  }

  Future<void> adicionarMensagemNuvem(Mensagem mensagem)async{
    await repository.adicionarMensagemNuvem(mensagem);
  }

  Future<void> adicionarOuAtualizarMensagemNuvemParaLocal(Mensagem mensagem)async{
    await repository.adicionarOuAtualizarMensagemNuvemParaLocal(mensagem);
  }

  Future<void> atualizarMensagemLocalSincronizadoTrue(Mensagem mensagem)async{
    await repository.atualizarMensagemLocalSincronizadoTrue(mensagem);
  }

  Stream<List<Mensagem>> abrirStreamMensagensLocal (String idConversa){
   return repository.abrirStreamMensagensLocal(idConversa);
  }

  Future<void> buscarTodasMensagensNuvemPorConversa(String idConversa)async{
    await repository.buscarTodasMensagensNuvemPorConversa(idConversa);
  }

  Future<void> buscar100MensagensNuvemPorConversa(String idConversa)async{
     await repository.buscar100MensagensNuvemPorConversa(idConversa);
  }

  Future<List<Mensagem>> buscarListaMensagensPorConversa(String idConversa) async{
   return await repository.buscarListaMensagensPorConversa(idConversa);
  }

  Future<void> removerMensagemLocal(Mensagem mensagem) async {
   await repository.removerMensagemLocal(mensagem);
  }
  
   Stream<QuerySnapshot<Map<String, dynamic>>> abrirStreamMensagensPorIdConversa (String idConversa){
   return repository.abrirStreamMensagensPorIdConversa(idConversa);
  }

  ////FUNÇÕES RELACIONADAS A SINCRONIZAÇÃO
  Future<void> sincronizarUsuarioNuvemParaLocal()async{
    await repository.sincronizarUsuarioNuvemParaLocal();
  }

  // FUNÇÕES RELACIONADAS A MENSAGEMDESTINATARIO
  Future<void> adicionarMensagemDestinatarioLocal(StatusMensagemDestinatario mensagemDestinatario)async{
   await repository.adicionarMensagemDestinatarioLocal(mensagemDestinatario);
  }

  Future<void> adicionarListaMensagemDestinatarioLocal(List<StatusMensagemDestinatario> listaMensagemDestinatario)async{
   await repository.adicionarListaMensagemDestinatarioLocal(listaMensagemDestinatario);
  }

  Future<List<StatusMensagemDestinatario>> buscarListaTodosMensagemDestinatarioLocal()async{
  return await repository.buscarListaTodosMensagemDestinatarioLocal();
  }

   Future<StatusMensagemDestinatario> buscarMensagemDestinatarioLocalPorIdsComposto(String idMensagem, String idDestinatario)async{
   return await repository.buscarMensagemDestinatarioLocalPorIdsComposto(idMensagem, idDestinatario);
  }
}