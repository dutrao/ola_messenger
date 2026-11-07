import 'package:drift/drift.dart';
import 'package:ola_messenger/database/database.dart';
import 'package:ola_messenger/model/mensagem.dart';
import 'package:ola_messenger/model/status_mensagem.dart';

class MensagemDao {
  final AppDatabase database;

  MensagemDao({required this.database});

  Future<void> adicionarMensagemLocal(Mensagem mensagem) async {
    await database
        .into(database.mensagemTabela)
        .insert(
          MensagemTabelaCompanion.insert(
            idMensagem: mensagem.idMensagem,
            idConversa: mensagem.idConversa,
            texto: mensagem.texto,
            horarioEnvio: mensagem.horarioEnvio,
            sincronizado: mensagem.sincronizado,
            idRemetente: mensagem.idRemetente,
            statusMensagem: mensagem.statusMensagem.name,
          ),
        );
  }

  Future<void> removerMensagemLocal(Mensagem mensagem) async {
    await (database.delete(
      database.mensagemTabela,
    )..where((tbl) => tbl.idMensagem.equals(mensagem.idMensagem))).go();
  }

  Future<void> adicionarListaMensagemLocal(
    List<Mensagem> listaMensagens,
  ) async {
    await database.batch((batch) {
      batch.insertAllOnConflictUpdate(
        database.mensagemTabela,
        listaMensagens.map((mensagem) {
          return MensagemTabelaCompanion.insert(
            idMensagem: mensagem.idMensagem,
            idConversa: mensagem.idConversa,
            texto: mensagem.texto,
            horarioEnvio: mensagem.horarioEnvio,
            sincronizado: mensagem.sincronizado,
            idRemetente: mensagem.idRemetente,
            statusMensagem: mensagem.statusMensagem.name,
          );
        }).toList(),
      );
    });
  }

  Future<void> adicionarOuAtualizarMensagemLocal(Mensagem mensagem) async {
    await database
        .into(database.mensagemTabela)
        .insertOnConflictUpdate(
          MensagemTabelaCompanion.insert(
            idMensagem: mensagem.idMensagem,
            idConversa: mensagem.idConversa,
            texto: mensagem.texto,
            horarioEnvio: mensagem.horarioEnvio,
            sincronizado: mensagem.sincronizado,
            idRemetente: mensagem.idRemetente,
            statusMensagem: mensagem.statusMensagem.name,
          ),
        );
  }

  Future<void> atualizarMensagemLocalSincronizadoTrue(Mensagem mensagem) async {
    await database
        .into(database.mensagemTabela)
        .insertOnConflictUpdate(
          MensagemTabelaCompanion.insert(
            idMensagem: mensagem.idMensagem,
            idConversa: mensagem.idConversa,
            texto: mensagem.texto,
            horarioEnvio: mensagem.horarioEnvio,
            sincronizado: true,
            idRemetente: mensagem.idRemetente,
            statusMensagem: mensagem.statusMensagem.name,
          ),
        );
  }

  Future<List<Mensagem>> pegarMensagensLocal() async {
    final resultados = await database.select(database.mensagemTabela).get();

    return resultados.map((resultado) {
      return Mensagem(
        idMensagem: resultado.idMensagem,
        idConversa: resultado.idConversa,
        texto: resultado.texto,
        horarioEnvio: resultado.horarioEnvio,
        sincronizado: resultado.sincronizado,
        idRemetente: resultado.idRemetente,
        statusMensagem: StatusMensagem.values.byName(resultado.statusMensagem),
      );
    }).toList();
  }

  Future<List<Mensagem>> buscarListaMensagensPorIdConversa(
    String idConversa,
  ) async {
    List<Mensagem> listaMensagens = [];
    final resultados = await (database.select(
      database.mensagemTabela,
    )..where((tbl) => tbl.idConversa.equals(idConversa))).get();
    for (final resultado in resultados) {
      listaMensagens.add(
        Mensagem(
          idMensagem: resultado.idMensagem,
          texto: resultado.texto,
          idConversa: resultado.idConversa,
          horarioEnvio: resultado.horarioEnvio,
          sincronizado: resultado.sincronizado,
          idRemetente: resultado.idRemetente,
          statusMensagem: StatusMensagem.values.byName(
            resultado.statusMensagem,
          ),
        ),
      );
    }
    return listaMensagens;
  }

  Stream<List<Mensagem>> abrirStreamMensagensLocal(String idConversa) {
    return (database.select(database.mensagemTabela)
          ..where((tbl) => tbl.idConversa.equals(idConversa))
          ..orderBy([(tbl) => OrderingTerm.desc(tbl.horarioEnvio)])
          ..limit(100))
        .watch()
        .map((resultados) {
          return resultados.map((resultado) {
            return Mensagem(
              idMensagem: resultado.idMensagem,
              idConversa: resultado.idConversa,
              texto: resultado.texto,
              horarioEnvio: resultado.horarioEnvio,
              sincronizado: resultado.sincronizado,
              idRemetente: resultado.idRemetente,
              statusMensagem: StatusMensagem.values.byName(
                resultado.statusMensagem,
              ),
            );
          }).toList().reversed.toList();
        });
  }
}
