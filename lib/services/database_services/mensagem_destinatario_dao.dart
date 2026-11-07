import 'package:drift/drift.dart';
import 'package:ola_messenger/database/database.dart';
import 'package:ola_messenger/model/status_mensagem_destinatario.dart';

class MensagemDestinatarioDao {
  AppDatabase database;
  MensagemDestinatarioDao({required this.database});

  Future<void> adicionarMensagemDestinaraioLocal(
    StatusMensagemDestinatario mensagemDestinatario,
  ) async {
    await database
        .into(database.statusMensagemDestinatarioTabela)
        .insertOnConflictUpdate(
          StatusMensagemDestinatarioTabelaCompanion.insert(
            idDestinatario: mensagemDestinatario.idDestinatario,
            idMensagem: mensagemDestinatario.idMensagem,
            sincronizado: mensagemDestinatario.sincronizado,
          ),
        );
  }

  Future<void> adicionarListaMensagemDestinaraioLocal(
    List<StatusMensagemDestinatario> listaMensagemDestinatario,
  ) async {
    await database.batch((batch) {
      batch.insertAllOnConflictUpdate(
        database.statusMensagemDestinatarioTabela,
        listaMensagemDestinatario.map((mensagemDestinatario) {
          return StatusMensagemDestinatarioTabelaCompanion.insert(
            idDestinatario: mensagemDestinatario.idDestinatario,
            idMensagem: mensagemDestinatario.idMensagem,
            sincronizado: mensagemDestinatario.sincronizado,
          );
        }).toList(),
      );
    });
  }

  Future<List<StatusMensagemDestinatario>>
  buscarListaTodosMensagemDestinatarioLocal() async {
    List<StatusMensagemDestinatario> listaMensagemDestinatario = [];
    final resultados = await database
        .select(database.statusMensagemDestinatarioTabela)
        .get();
    for (final resultado in resultados) {
      listaMensagemDestinatario.add(
        StatusMensagemDestinatario(
          idDestinatario: resultado.idDestinatario,
          idMensagem: resultado.idMensagem,
          horarioRecebimento: resultado.horarioRecebimento,
          horarioLido: resultado.horarioLido,
          sincronizado: resultado.sincronizado,
        ),
      );
    }
    return listaMensagemDestinatario;
  }

  Future<StatusMensagemDestinatario> buscarMensagemDestinatarioLocalPorIdsComposto(
    String idMensagem,
    String idDestinatario,
  ) async {
    final resultado =
        await (database.select(database.statusMensagemDestinatarioTabela)..where(
              (tbl) =>
                  tbl.idMensagem.equals(idMensagem) &
                  tbl.idDestinatario.equals(idDestinatario),
            ))
            .getSingle();

    return StatusMensagemDestinatario(
      idDestinatario: resultado.idDestinatario,
      idMensagem: resultado.idMensagem,
      horarioRecebimento: resultado.horarioRecebimento,
      horarioLido: resultado.horarioLido,
      sincronizado: resultado.sincronizado,
    );
  }
}
