class UsuarioConversa {
  String idUsuario;
  String idConversa;
  bool sincronizado;

  UsuarioConversa({
    required this.idUsuario,
    required this.idConversa,
    required this.sincronizado,
  });

  factory UsuarioConversa.fromMap(Map<String, dynamic> map) {
    return UsuarioConversa(
      idUsuario: map['idUsuario'] as String,
      idConversa: map['idConversa'] as String,
      sincronizado: map['sincronizado'] as bool,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'idUsuario': idUsuario,
      'idConversa': idConversa,
      'sincronizado': sincronizado,
    };
  }
}
