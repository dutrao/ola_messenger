import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ola_messenger/model/conversa.dart';
import 'package:ola_messenger/model/mensagem.dart';
import 'package:ola_messenger/model/status_mensagem_destinatario.dart';
import 'package:ola_messenger/model/usuario.dart';
import 'package:ola_messenger/model/usuario_conversa.dart';

class FirestoreService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> adicionarUsuarioNuvem(Usuario usuario) async {
    await firestore
        .collection("usuarios")
        .doc(usuario.idUsuario)
        .set(usuario.toMap());
  }

  Future<List<Usuario>> pegarListaUsuarios() async {
    List<Usuario> listaUsuarios = [];
    final respostas = await firestore.collection("usuarios").get();
    for (final resposta in respostas.docs) {
      listaUsuarios.add(Usuario.fromMap(resposta.data()));
    }
    return listaUsuarios;
  }

  //FUNÇÕES RELACIONADAS A MENSAGEM
  Future<void> adicionarMensagemNuvem(Mensagem mensagem) async {
    await firestore
        .collection('mensagens')
        .doc(mensagem.idMensagem)
        .set(mensagem.toMap());
  }

  Future<List<Mensagem>> buscarTodasMensagensNuvem(Mensagem mensagem) async {
    List<Mensagem> listaTodasMensagens = [];
    final resultados = await firestore.collection('mensagens').get();
    for (final resultado in resultados.docs) {
      listaTodasMensagens.add(Mensagem.fromMap(resultado.data()));
    }
    return listaTodasMensagens;
  }

  Future<List<String>> buscarListaIdMensagensUsuarioNuvem(List<String> listaIdConversas) async {
    List<String> listaIdMensagens = [];
    final resultados = await firestore
        .collection('mensagens')
        .where('idConversa', whereIn: listaIdConversas)
        .get();
    for (final resultado in resultados.docs) {
      listaIdMensagens.add(resultado.data()['idMensagem']);
    }
    return listaIdMensagens;
  }

  Future<List<Mensagem>> buscarTodasMensagensNuvemPorConversa(
    String idConversa,
  ) async {
    List<Mensagem> listaTodasMensagens = [];
    final resultados = await firestore
        .collection('mensagens')
        .where("idConversa", isEqualTo: idConversa)
        .get();
    for (final resultado in resultados.docs) {
      listaTodasMensagens.add(Mensagem.fromMap(resultado.data()));
    }
    return listaTodasMensagens;
  }

  Future<List<Mensagem>> buscar100MensagensNuvemPorConversa(
    String idConversa,
  ) async {
    List<Mensagem> listaTodasMensagens = [];
    final resultados = await firestore
        .collection('mensagens')
        .where("idConversa", isEqualTo: idConversa)
        .limit(100)
        .orderBy('horarioEnvio', descending: true)
        .get();
    for (final resultado in resultados.docs) {
      listaTodasMensagens.add(Mensagem.fromMap(resultado.data()));
    }
    return listaTodasMensagens.reversed.toList();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> abrirStreamMensagensPorIdConversa(
   List<String> listaIdConversa,
  ) {
    return firestore
        .collection('mensagens')
        .where('idConversa', whereIn: listaIdConversa)
        .snapshots();
  }

  //FUNÇÕES RELACIONADAS A USUARIOCONVERSA

  Future<void> adicionarUsuarioConversaNuvem(
    UsuarioConversa usuarioConversa,
  ) async {
    await firestore
        .collection('usuarioConversa')
        .doc('${usuarioConversa.idUsuario}_${usuarioConversa.idConversa}')
        .set(usuarioConversa.toMap());
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> abrirStreamUsuarioConversaNuvem(
    String idUsuario,
  ) {
    return firestore
        .collection('usuarioConversa')
        .where('idUsuario', isEqualTo: idUsuario)
        .snapshots();
  }

  //FUNÇÕES RELACIONADAS A CONVERSA

  Future<void> adicionarConversaNuvem(Conversa conversa) async {
    await firestore
        .collection('conversas')
        .doc(conversa.idConversa)
        .set(conversa.toMap());
  }

  Future<List<String>> buscarListaIdConversasUsuarioNuvem(
    String idUsuario,
  ) async {
    List<String> listaIdConversas = [];
    final resultados = await firestore
        .collection('usuarioConversa')
        .where('idUsuario', isEqualTo: idUsuario)
        .get();
    for (final resultado in resultados.docs) {
      final usuarioConversa = UsuarioConversa.fromMap(resultado.data());
      listaIdConversas.add(usuarioConversa.idConversa);
    }
    return listaIdConversas;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> abrirStreamConversaNuvem(
    List<String> listaIdConversa,    
  )  { 
    return firestore
        .collection('conversas')
        .where('idConversa', whereIn: listaIdConversa)
        .snapshots();
  }

  //FUNÇÕES RELACIONADAS A STATUSMENSAGEMDESTINATARIO

  Future<void> adicionarStatusMensagemDestinatarioNuvem(
    StatusMensagemDestinatario statusMensagemDestinatario,
  ) async {
    await firestore
        .collection('mensagemDestinatarios')
        .doc(
          '${statusMensagemDestinatario.idMensagem}_${statusMensagemDestinatario.idDestinatario}',
        )
        .set(statusMensagemDestinatario.toMap());
  }

  Future<List<String>> buscarListaConversasNuvemPorUsuario(
    String idUsuario,
  ) async {
    List<String> listaIdConversas = [];
    final resultados = await firestore
        .collection('usuarioConversa')
        .where('idUsuario', isEqualTo: idUsuario)
        .get();
    for (final resultado in resultados.docs) {
      final usuarioConversa = UsuarioConversa.fromMap(resultado.data());
      listaIdConversas.add(usuarioConversa.idConversa);
    }
    return listaIdConversas;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>>
  abrirStreamStatusMensagemDestinatarioNuvem(List<String> idMensagens) {
    return firestore
        .collection('statusMensagemDestinatarios')
        .where('idMensagem', whereIn: idMensagens)
        .snapshots();
  }
}
