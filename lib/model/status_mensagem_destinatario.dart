import 'package:cloud_firestore/cloud_firestore.dart';

class StatusMensagemDestinatario {
  String idDestinatario;
  String idMensagem;
  DateTime? horarioRecebimento;
  DateTime? horarioLido;
  bool sincronizado;

  StatusMensagemDestinatario({
    required this.idDestinatario,
    required this.idMensagem,
    required this.horarioRecebimento,
    required this.horarioLido,
    required this.sincronizado,
  });

  factory StatusMensagemDestinatario.fromMap(Map<String, dynamic> map) {
    return StatusMensagemDestinatario(
      idDestinatario: map['idDestinatario'] as String,
      idMensagem: map['idMensagem'] as String,
      horarioRecebimento: map['horarioRecebimento'] != null
          ? (map['horarioRecebimento'] as Timestamp).toDate()
          : null,
      horarioLido: map['horarioLido'] != null
          ? (map['horarioLido'] as Timestamp).toDate()
          : null,
      sincronizado: map['sincronizado'] as bool,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'idDestinatario': idDestinatario,
      'idMensagem': idMensagem,
      'horarioRecebimento': horarioRecebimento,
      'horarioLido': horarioLido,
      'sincronizado': sincronizado,
    };
  }
}