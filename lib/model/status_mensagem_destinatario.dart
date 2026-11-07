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
}
