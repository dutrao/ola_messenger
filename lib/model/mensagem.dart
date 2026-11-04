
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ola_messenger/model/status_mensagem.dart';

class Mensagem {
  String idMensagem;
  String idRemetente;
  String idConversa;
  String texto;
  DateTime horarioEnvio;
  DateTime? horarioEntregue;
  DateTime? horarioLeitura;
  StatusMensagem statusMensagem;
  bool sincronizado;

  Mensagem({
    required this.idMensagem,
    required this.idRemetente,
    required this.texto,
    required this.idConversa,
    required this.horarioEnvio,
    this.horarioEntregue,
    this.horarioLeitura,
    required this.statusMensagem,
    required this.sincronizado,
  });

  factory Mensagem.fromMap(Map<String, dynamic> map) {
    return Mensagem(
      idMensagem: map['idMensagem'] as String,
      idRemetente: map['idRemetente'] as String,
      idConversa: map['idConversa'] as String,
      texto: map['conteudo'] as String,

      horarioEnvio:
          (map['horarioEnvio'] as Timestamp).toDate(),

      horarioEntregue: map['horarioEntregue'] != null
          ? (map['horarioEntregue'] as Timestamp).toDate()
          : null,

      horarioLeitura: map['horarioLeitura'] != null
          ? (map['horarioLeitura'] as Timestamp).toDate()
          : null,

      statusMensagem: StatusMensagem.values.byName(
        map['statusMensagem'] as String,
      ),

      sincronizado: map['sincronizado'] as bool,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'idMensagem': idMensagem,
      'idRemetente': idRemetente,
      'idConversa': idConversa,
      'conteudo': texto,
      'horarioEnvio': horarioEnvio,
      'horarioEntregue': horarioEntregue,
      'horarioLeitura': horarioLeitura,
      'statusMensagem': statusMensagem.name,
      'sincronizado': sincronizado,
    };
  }
}
