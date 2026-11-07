import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ola_messenger/database/database.dart';
import 'package:ola_messenger/model/conversa.dart';
import 'package:ola_messenger/model/mensagem.dart';
import 'package:ola_messenger/model/status_mensagem_destinatario.dart';
import 'package:ola_messenger/model/usuario.dart';
import 'package:ola_messenger/model/usuario_conversa.dart';
import 'package:ola_messenger/services/database_services/conversa_dao.dart';
import 'package:ola_messenger/services/database_services/mensagem_dao.dart';
import 'package:ola_messenger/services/database_services/mensagem_destinatario_dao.dart';
import 'package:ola_messenger/services/database_services/usuario_conversa_dao.dart';
import 'package:ola_messenger/services/database_services/usuario_dao.dart';
import 'package:ola_messenger/services/firebase_services/auth_service.dart';
import 'package:ola_messenger/services/firebase_services/firestore_service.dart';

class Repository {
  AppDatabase database;
  AuthService authService = AuthService();
  FirestoreService firestoreService = FirestoreService();
  late UsuarioDao usuarioDao = UsuarioDao(database: database);
  late UsuarioConversaDao usuarioConversaDao = UsuarioConversaDao(database: database);
  late ConversaDao conversaDao = ConversaDao(database: database);
  late MensagemDao mensagemDao = MensagemDao(database: database);
  late MensagemDestinatarioDao mensagemDestinatarioDao = MensagemDestinatarioDao(database: database);
  Repository({required this.database});
 

  Future<void> fazerLogin(String email, String senha)async{
   await authService.fazerLogin(email, senha);
  }

   Future<void> criarConta(String email, String senha)async{
   await authService.criarConta(email, senha);
  }

   Future<void> deslogar()async{
    await authService.deslogar();
  }

  User? pegarUsuario(){
   return authService.pegarUsuario();
  }

  ////FUNÇÕES RELACIONADAS A USUARIO
  
  Future<void> adicionarUsuarioLocal(Usuario usuario)async{
    await usuarioDao.adicionarUsuarioLocal(usuario);
  }

  Future<void> adicionarUsuarioNuvem(Usuario usuario)async{
    await firestoreService.adicionarUsuarioNuvem(usuario);
  }

  Future<List<Usuario>> pegarListaUsuarios()async{
    return await usuarioDao.pegarListaUsuarios();
  }

  ////FUNÇÕES RELACIONADAS A USUARIOCONVERSA
  
  Future<void> adicionarUsuarioConversaLocal(UsuarioConversa usuarioConversa)async{
    await usuarioConversaDao.adicionarUsuarioConversaLocal(usuarioConversa);
  }

  Future<Conversa?> pegarConversaEntreDoisUsuariosLocal(String idUsuario01, String idUsuario02)async{
   return await usuarioConversaDao.pegarConversaEntreDoisUsuariosLocal(idUsuario01, idUsuario02);
  }

  ////FUNÇÕES RELACIONADAS A CONVERSA
  Future<void> adicionarConversaLocal(Conversa conversa)async{
    await conversaDao.adicionarConversaLocal(conversa);
  }

  ////FUNÇÕES RELACIONADAS A MENSAGEM
  Future<void> adicionarMensagemLocal(Mensagem mensagem)async{
    await mensagemDao.adicionarMensagemLocal(mensagem);
  }

  Future<void> removerMensagemLocal(Mensagem mensagem) async {
   await mensagemDao.removerMensagemLocal(mensagem);
  }

   Future<List<Mensagem>> buscarListaMensagensPorConversa(String idConversa) async {
   return await mensagemDao.buscarListaMensagensPorIdConversa(idConversa);
  }

   Stream<List<Mensagem>> abrirStreamMensagensLocal (String idConversa){
   return mensagemDao.abrirStreamMensagensLocal(idConversa);
  }

  Future<void> adicionarOuAtualizarMensagemNuvemParaLocal(Mensagem mensagem)async{
    await mensagemDao.adicionarOuAtualizarMensagemLocal(mensagem);
  }

  Future<void> atualizarMensagemLocalSincronizadoTrue(Mensagem mensagem)async{
    await mensagemDao.atualizarMensagemLocalSincronizadoTrue(mensagem);
  }

  Future<void> buscarTodasMensagensNuvemPorConversa(String idConversa)async{
    await firestoreService.buscarTodasMensagensNuvemPorConversa(idConversa);
  }

  Future<void> buscar100MensagensNuvemPorConversa(String idConversa)async{
     await firestoreService.buscar100MensagensNuvemPorConversa(idConversa);
  }

  Future<void> adicionarMensagemNuvem(Mensagem mensagem)async{
    await firestoreService.adicionarMensagemNuvem(mensagem);
  }

   Stream<QuerySnapshot<Map<String, dynamic>>> abrirStreamMensagensPorIdConversa (String idConversa){
   return firestoreService.abrirStreamMensagensPorIdConversa(idConversa);
  }

  ////FUNÇÕES RELACIONADAS A SINCRONIZAÇÃO DE USUARIO
  Future<void>sincronizarUsuarioNuvemParaLocal()async{
   try {
     List<Usuario> listaUsuarios = await firestoreService.pegarListaUsuarios();
     await usuarioDao.adicionarListaUsuarioLocal(listaUsuarios);
     print("sucesso ao sincronizar usuarios nuvem para local");
   } on Exception {
    print("erro ao sincronizar usuarios nuvem para local");
     // TODO
   }
  }

  // FUNÇÕES RELACIONADAS A MENSAGEMDESTINATARIO
  Future<void> adicionarMensagemDestinatarioLocal(StatusMensagemDestinatario mensagemDestinatario)async{
   await mensagemDestinatarioDao.adicionarMensagemDestinaraioLocal(mensagemDestinatario);
  }

  Future<void> adicionarListaMensagemDestinatarioLocal(List<StatusMensagemDestinatario> listaMensagemDestinatario)async{
   await mensagemDestinatarioDao.adicionarListaMensagemDestinaraioLocal(listaMensagemDestinatario);
  }

  Future<List<StatusMensagemDestinatario>> buscarListaTodosMensagemDestinatarioLocal()async{
  return await mensagemDestinatarioDao.buscarListaTodosMensagemDestinatarioLocal();
  }

   Future<StatusMensagemDestinatario> buscarMensagemDestinatarioLocalPorIdsComposto(String idMensagem, String idDestinatario)async{
   return await mensagemDestinatarioDao.buscarMensagemDestinatarioLocalPorIdsComposto(idMensagem, idDestinatario);
  }

}