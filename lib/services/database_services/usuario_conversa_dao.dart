import 'package:drift/drift.dart';
import 'package:ola_messenger/database/database.dart';
import 'package:ola_messenger/model/conversa.dart';
import 'package:ola_messenger/model/usuario_conversa.dart';

class UsuarioConversaDao {
  final AppDatabase database;

  UsuarioConversaDao({required this.database});

  Future<void> adicionarUsuarioConversaLocal(
    UsuarioConversa usuarioConversa,
  ) async {
    await database
        .into(database.usuarioConversaTabela)
        .insert(
          UsuarioConversaTabelaCompanion.insert(
            idUsuario: usuarioConversa.idUsuario,
            idConversa: usuarioConversa.idConversa,
            sincronizado: usuarioConversa.sincronizado,
          ),
        );
  }

  Future<void> adicionarOuAtualizarUsuarioConversaLocal(
    UsuarioConversa usuarioConversa,
  ) async {
    await database
        .into(database.usuarioConversaTabela)
        .insertOnConflictUpdate(
          UsuarioConversaTabelaCompanion.insert(
            idUsuario: usuarioConversa.idUsuario,
            idConversa: usuarioConversa.idConversa,
            sincronizado: usuarioConversa.sincronizado,
          ),
        );
  }

  Future<void> removerUsuarioConversaLocal(
    UsuarioConversa usuarioConversa,
  ) async {
    await (database.delete(database.usuarioConversaTabela)..where(
          (tbl) =>
              tbl.idUsuario.equals(usuarioConversa.idUsuario) &
              tbl.idConversa.equals(usuarioConversa.idConversa),
        ))
        .go();
  }

  Future<void> adicionarListaUsuarioConversaLocal(
    List<UsuarioConversa> listaUsuarioConversa,
  ) async {
    await database.batch((batch) {
      batch.insertAllOnConflictUpdate(
        database.usuarioConversaTabela,
        listaUsuarioConversa.map((usuarioConversa) {
          return UsuarioConversaTabelaCompanion.insert(
            idUsuario: usuarioConversa.idUsuario,
            idConversa: usuarioConversa.idConversa,
            sincronizado: usuarioConversa.sincronizado,
          );
        }).toList(),
      );
    });
  }

  Future<List<UsuarioConversa>> pegarUsuariosConversaLocal() async {
    final resultados = await database
        .select(database.usuarioConversaTabela)
        .get();

    return resultados.map((resultado) {
      return UsuarioConversa(
        idUsuario: resultado.idUsuario,
        idConversa: resultado.idConversa,
        sincronizado: resultado.sincronizado,
      );
    }).toList();
  }

  Future<List<String>> buscarListaConversasPorUsuarioLocal(
    String idUsuario,
  ) async {
    List<String> listaIdConversas = [];

    final resultados = await (database.select(
      database.usuarioConversaTabela,
    )..where((tbl) => tbl.idUsuario.equals(idUsuario))).get();
    for (final resultado in resultados) {
      listaIdConversas.add(resultado.idConversa);
    }
    return listaIdConversas;
  }

  Future<Conversa?> pegarConversaEntreDoisUsuariosLocal(
    String idUsuario01,
    String idUsuario02,
  ) async {
    final uc1 = database.alias(database.usuarioConversaTabela, 'uc1');

    final uc2 = database.alias(database.usuarioConversaTabela, 'uc2');

    final conversa = database.conversaTabela;

    final query =
        database.select(conversa).join([
            innerJoin(uc1, uc1.idConversa.equalsExp(conversa.idConversa)),
            innerJoin(uc2, uc2.idConversa.equalsExp(conversa.idConversa)),
          ])
          ..where(
            uc1.idUsuario.equals(idUsuario01) &
                uc2.idUsuario.equals(idUsuario02) &
                conversa.isGrupo.equals(false),
          )
          ..limit(1);

    final resultado = await query.getSingleOrNull();

    if (resultado == null) return null;

    final dados = resultado.readTable(conversa);

    return Conversa(
      idConversa: dados.idConversa,
      isGrupo: dados.isGrupo,
      sincronizado: dados.sincronizado,
    );
  }
}
