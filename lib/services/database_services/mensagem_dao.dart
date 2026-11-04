import 'package:ola_messenger/database/database.dart';
import 'package:ola_messenger/model/mensagem.dart';

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
          ),
        );
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
          );
        }).toList(),
      );
    });
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
      );
    }).toList();
  }

  Future<List<Mensagem>> buscarMensagensPorIdConversa(String idConversa) async {
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
        ),
      );
    }
    return listaMensagens;
  }
}
