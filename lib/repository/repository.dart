import 'package:firebase_auth/firebase_auth.dart';
import 'package:ola_messenger/database/database.dart';
import 'package:ola_messenger/model/conversa.dart';
import 'package:ola_messenger/model/mensagem.dart';
import 'package:ola_messenger/model/usuario.dart';
import 'package:ola_messenger/model/usuario_conversa.dart';
import 'package:ola_messenger/services/database_services/conversa_dao.dart';
import 'package:ola_messenger/services/database_services/mensagem_dao.dart';
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

  Future<List<Mensagem>> buscarMensagensPorIdConversa(String idConversa) async{
   return await mensagemDao.buscarMensagensPorIdConversa(idConversa);
  }

  Future<void> adicionarMensagemNuvem(Mensagem mensagem)async{
    await firestoreService.adicionarMensagemNuvem(mensagem);
  }

  ////FUNÇÕES RELACIONADAS A SINCRONIZAÇÃO DE USUARIO
  Future<void>sincronizarUsuarioNuvemParaLocal()async{
   try {
     List<Usuario> listaUsuarios = await firestoreService.pegarListaUsuarios();
     await usuarioDao.adicionarListaUsuarioLocal(listaUsuarios);
     print("sucesso ao sincronizar usuarios nuvem para local");
   } on Exception catch (e) {
    print("erro ao sincronizar usuarios nuvem para local");
     // TODO
   }
  }

}