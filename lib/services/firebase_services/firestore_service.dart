import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ola_messenger/model/mensagem.dart';
import 'package:ola_messenger/model/usuario.dart';

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
    String idConversa,
  ) {
    return firestore
        .collection('mensagens')
        .where('idConversa', isEqualTo: idConversa)       
        .snapshots();
  }
}
