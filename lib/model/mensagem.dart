
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ola_messenger/model/status_mensagem.dart';

class Mensagem {
  String idMensagem;
  String idRemetente;
  String idConversa;
  String texto;  
  DateTime horarioEnvio; 
  StatusMensagem statusMensagem;
  bool sincronizado;

  Mensagem({
    required this.idMensagem,
    required this.idRemetente,
    required this.texto,
    required this.idConversa,
    required this.horarioEnvio,
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
      'statusMensagem': statusMensagem.name,
      'sincronizado': sincronizado,
    };
  }
}
