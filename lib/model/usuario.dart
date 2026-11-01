class Usuario {
  String idUsuario;
  String nome;
  String sobrenome;
  bool sincronizado;

  Usuario({
    required this.idUsuario,
    required this.nome,
    required this.sobrenome,
    required this.sincronizado,
  });

  factory Usuario.fromMap(Map<String, dynamic> map) {
    return Usuario(
      idUsuario: map["idUsuario"],
      nome: map["nome"],
      sobrenome: map["sobrenome"],
      sincronizado: map["sincronizado"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "idUsuario": idUsuario,
      "nome": nome,
      "sobrenome": sobrenome,
      "sincronizado": sincronizado,
    };
  }
}
