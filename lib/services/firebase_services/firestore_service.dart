import 'package:cloud_firestore/cloud_firestore.dart';
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
}
