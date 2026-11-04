class Conversa {
  String idConversa;
  bool isGrupo;
  bool sincronizado;

  Conversa({
    required this.isGrupo,
    required this.idConversa,
    required this.sincronizado,
  });

  factory Conversa.fromMap(Map<String, dynamic> map) {
    return Conversa(
      idConversa: map['idConversa'] as String,
      isGrupo: map['isGrupo'] as bool, sincronizado: map['sincronizado'] as bool,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'idConversa': idConversa,
      'isGrupo': isGrupo,
      'sincronizado': sincronizado
    };
  }
}
