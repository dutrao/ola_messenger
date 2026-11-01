import 'package:ola_messenger/database/database.dart';
import 'package:ola_messenger/model/usuario.dart';

class UsuarioDao {
  AppDatabase database;
  UsuarioDao({required this.database});

  Future<void> adicionarUsuarioLocal(Usuario usuario) async {
    await database
        .into(database.usuarioTabela)
        .insertOnConflictUpdate(
          UsuarioTabelaCompanion.insert(
            idUsuario: usuario.idUsuario,
            nomeUsuario: usuario.nome,
            sobrenomeUsuario: usuario.sobrenome,
            sincronizado: usuario.sincronizado,
          ),
        );
  }

  Future<void> adicionarListaUsuarioLocal(List<Usuario> listaUsuarios) async {
   await database.batch((batch) {
      batch.insertAllOnConflictUpdate(
        database.usuarioTabela,
        listaUsuarios.map((e) {
          return UsuarioTabelaCompanion.insert(
            idUsuario: e.idUsuario,
            nomeUsuario: e.nome,
            sobrenomeUsuario: e.sobrenome,
            sincronizado: e.sincronizado,
          );
        }).toList(),
      );
    });
  }

  Future<List<Usuario>> pegarListaUsuarios() async {
    List<Usuario> listaUsuarios = [];
    final respostas = await database.select(database.usuarioTabela).get();
    for (final resposta in respostas) {
      listaUsuarios.add(
        Usuario(
          idUsuario: resposta.idUsuario,
          nome: resposta.nomeUsuario,
          sobrenome: resposta.sobrenomeUsuario,
          sincronizado: resposta.sincronizado,
        ),
      );
    }
    return listaUsuarios;
  }
}
