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
import 'package:ola_messenger/services/database_services/status_mensagem_destinatario_dao.dart';
import 'package:ola_messenger/services/database_services/usuario_conversa_dao.dart';
import 'package:ola_messenger/services/database_services/usuario_dao.dart';
import 'package:ola_messenger/services/firebase_services/auth_service.dart';
import 'package:ola_messenger/services/firebase_services/firestore_service.dart';

class Repository {
  AppDatabase database;
  AuthService authService = AuthService();
  FirestoreService firestoreService = FirestoreService();
  late UsuarioDao usuarioDao = UsuarioDao(database: database);
  late UsuarioConversaDao usuarioConversaDao = UsuarioConversaDao(
    database: database,
  );
  late ConversaDao conversaDao = ConversaDao(database: database);
  late MensagemDao mensagemDao = MensagemDao(database: database);
  late StatusMensagemDestinatarioDao mensagemDestinatarioDao =
      StatusMensagemDestinatarioDao(database: database);
  Repository({required this.database});

  Future<void> fazerLogin(String email, String senha) async {
    await authService.fazerLogin(email, senha);
  }

  Future<void> criarConta(String email, String senha) async {
    await authService.criarConta(email, senha);
  }

  Future<void> deslogar() async {
    await authService.deslogar();
  }

  User? pegarUsuario() {
    return authService.pegarUsuario();
  }

  ////FUNÇÕES RELACIONADAS A USUARIO

  Future<void> adicionarUsuarioLocal(Usuario usuario) async {
    await usuarioDao.adicionarUsuarioLocal(usuario);
  }

  Future<void> adicionarUsuarioNuvem(Usuario usuario) async {
    await firestoreService.adicionarUsuarioNuvem(usuario);
  }

  Future<List<Usuario>> pegarListaUsuarios() async {
    return await usuarioDao.pegarListaUsuarios();
  }

  ////FUNÇÕES RELACIONADAS A USUARIOCONVERSA

  Future<void> adicionarUsuarioConversaLocal(
    UsuarioConversa usuarioConversa,
  ) async {
    await usuarioConversaDao.adicionarUsuarioConversaLocal(usuarioConversa);
  }

  Future<void>adicionarOuAtualizarUsuarioConversaLocal(
    UsuarioConversa usuarioConversa,
  ) async {
    await usuarioConversaDao
        .adicionarOuAtualizarUsuarioConversaLocal(usuarioConversa);
  }

  Future<void>removerUsuarioConversaLocal(
    UsuarioConversa usuarioConversa,
  ) async {
    await usuarioConversaDao
        .removerUsuarioConversaLocal(usuarioConversa);
  }


  Future<void> adicionarUsuarioConversaNuvem(
    UsuarioConversa usuarioConversa,
  ) async {
    await firestoreService.adicionarUsuarioConversaNuvem(usuarioConversa);
  }

  Future<Conversa?> pegarConversaEntreDoisUsuariosLocal(
    String idUsuario01,
    String idUsuario02,
  ) async {
    return await usuarioConversaDao.pegarConversaEntreDoisUsuariosLocal(
      idUsuario01,
      idUsuario02,
    );
  }

  ////FUNÇÕES RELACIONADAS A CONVERSA
  Future<void> adicionarConversaLocal(Conversa conversa) async {
    await conversaDao.adicionarConversaLocal(conversa);
  }

  Future<void> adicionarConversaNuvem(Conversa conversa) async {
    await firestoreService.adicionarConversaNuvem(conversa);
  }

  Future<void> adicionarOuAtualizarConversaLocal(Conversa conversa) async {
    await conversaDao.adicionarOuAtualizarConversaLocal(conversa);
  }

  Future<void> removerConversaLocal(Conversa conversa) async {
    await conversaDao.removerConversaLocal(conversa);
  }

  Future<List<String>> buscarListaIdConversasUsuarioNuvem(String idUsuario) async {
    return await firestoreService.buscarListaIdConversasUsuarioNuvem(idUsuario);
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> abrirStreamConversaNuvem(
    List<String> listaIdConversa,
  ) {
    return firestoreService.abrirStreamConversaNuvem(listaIdConversa);
  }

  ////FUNÇÕES RELACIONADAS A MENSAGEM
  Future<void> adicionarMensagemLocal(Mensagem mensagem) async {
    await mensagemDao.adicionarMensagemLocal(mensagem);
  }

  Future<void> removerMensagemLocal(Mensagem mensagem) async {
    await mensagemDao.removerMensagemLocal(mensagem);
  }

  Future<List<Mensagem>> buscarListaMensagensPorConversa(
    String idConversa,
  ) async {
    return await mensagemDao.buscarListaMensagensPorIdConversa(idConversa);
  }

  Future<List<String>> buscarListaIdMensagensUsuarioNuvem(List<String> listaIdConversas) async {
    return await firestoreService.buscarListaIdMensagensUsuarioNuvem(listaIdConversas);
  }

  Stream<List<Mensagem>> abrirStreamMensagensLocal(String idConversa) {
    return mensagemDao.abrirStreamMensagensLocal(idConversa);
  }

  Future<void> adicionarOuAtualizarMensagemLocal(Mensagem mensagem) async {
    await mensagemDao.adicionarOuAtualizarMensagemLocal(mensagem);
  }

  Future<void> atualizarMensagemLocalSincronizadoTrue(Mensagem mensagem) async {
    await mensagemDao.atualizarMensagemLocalSincronizadoTrue(mensagem);
  }

  Future<void> buscarTodasMensagensNuvemPorConversa(String idConversa) async {
    await firestoreService.buscarTodasMensagensNuvemPorConversa(idConversa);
  }

  Future<void> buscar100MensagensNuvemPorConversa(String idConversa) async {
    await firestoreService.buscar100MensagensNuvemPorConversa(idConversa);
  }

  Future<void> adicionarMensagemNuvem(Mensagem mensagem) async {
    await firestoreService.adicionarMensagemNuvem(mensagem);
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> abrirStreamMensagensPorListaIdConversa(
    List<String> listaIdConversa,
  ) {
    return firestoreService.abrirStreamMensagensPorIdConversa(listaIdConversa);
  }

  ////FUNÇÕES RELACIONADAS A SINCRONIZAÇÃO
  Future<void> sincronizarUsuarioNuvemParaLocal() async {
    try {
      List<Usuario> listaUsuarios = await firestoreService.pegarListaUsuarios();
      await usuarioDao.adicionarListaUsuarioLocal(listaUsuarios);
      print("sucesso ao sincronizar usuarios nuvem para local");
    } on Exception {
      print("erro ao sincronizar usuarios nuvem para local");
      // TODO
    }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> abrirStreamUsuarioConversaNuvem(
    String idUsuario,
  ) {
    return firestoreService.abrirStreamUsuarioConversaNuvem(idUsuario);
  }

  // FUNÇÕES RELACIONADAS A STATUSMENSAGEMDESTINATARIO
  Future<void> adicionarMensagemDestinatarioLocal(
    StatusMensagemDestinatario mensagemDestinatario,
  ) async {
    await mensagemDestinatarioDao.adicionarMensagemDestinaraioLocal(
      mensagemDestinatario,
    );
  }

  Future<void> adicionarListaMensagemDestinatarioLocal(
    List<StatusMensagemDestinatario> listaMensagemDestinatario,
  ) async {
    await mensagemDestinatarioDao.adicionarListaStatusMensagemDestinaraioLocal(
      listaMensagemDestinatario,
    );
  }

  Future<void> adicionarStatusMensagemDestinatarioNuvem(
    StatusMensagemDestinatario mensagemDestinatario,
  ) async {
    await firestoreService.adicionarStatusMensagemDestinatarioNuvem(
      mensagemDestinatario,
    );
  }

  Future<void> adicionarOuAtualizarMensagemDestinatarioLocal(
    StatusMensagemDestinatario mensagemDestinatario,
  ) async {
    mensagemDestinatarioDao.adicionarOuAtualizarStatusMensagemDestinatarioLocal(
      mensagemDestinatario,
    );
  }

  Future<void> removerStatusMensagemDestinatarioLocal(
    StatusMensagemDestinatario mensagemDestinatario,
  ) async {
    await mensagemDestinatarioDao.removerStatusMensagemDestinatarioLocal(
      mensagemDestinatario,
    );
  }

  Stream<QuerySnapshot<Map<String, dynamic>>>
  abrirStreamStatusMensagemDestinatarioNuvem(List<String> listaIdMensagens) {
    return firestoreService.abrirStreamStatusMensagemDestinatarioNuvem(listaIdMensagens);
  }

  Future<List<StatusMensagemDestinatario>>
  buscarListaTodosStatusMensagemDestinatarioLocal() async {
    return await mensagemDestinatarioDao
        .buscarListaTodosStatusMensagemDestinatarioLocal();
  }

  Future<StatusMensagemDestinatario>
  buscarMensagemDestinatarioLocalPorIdsComposto(
    String idMensagem,
    String idDestinatario,
  ) async {
    return await mensagemDestinatarioDao
        .buscarMensagemDestinatarioLocalPorIdsComposto(
          idMensagem,
          idDestinatario,
        );
  }
}
