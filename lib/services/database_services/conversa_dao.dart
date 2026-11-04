import 'package:drift/drift.dart';
import 'package:ola_messenger/database/database.dart';
import 'package:ola_messenger/model/conversa.dart';

class ConversaDao {
  final AppDatabase database;

  ConversaDao({required this.database});

  Future<void> adicionarConversaLocal(Conversa conversa) async {
    await database
        .into(database.conversaTabela)
        .insertOnConflictUpdate(
          ConversaTabelaCompanion.insert(
            idConversa: conversa.idConversa,
            isGrupo: conversa.isGrupo,
            sincronizado: conversa.sincronizado,
          ),
        );
  }

  Future<void> adicionarListaConversaLocal(
    List<Conversa> listaConversas,
  ) async {
    await database.batch((batch) {
      batch.insertAllOnConflictUpdate(
        database.conversaTabela,
        listaConversas.map((conversa) {
          return ConversaTabelaCompanion.insert(
            idConversa: conversa.idConversa,
            isGrupo: conversa.isGrupo,
            sincronizado: conversa.sincronizado,
          );
        }).toList(),
      );
    });
  }

  Future<List<Conversa>> pegarConversasLocal() async {
    List<Conversa> listaConversas = [];
    final resultados = await database.select(database.conversaTabela).get();
    for (final resultado in resultados) {
      listaConversas.add(
        Conversa(
          isGrupo: resultado.isGrupo,
          idConversa: resultado.idConversa,
          sincronizado: resultado.sincronizado,
        ),
      );
    }
    return listaConversas;
  }


}
