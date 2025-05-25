class Mago {
  final String nome;
  final int idade;
  final int nivelMagico;
  final double inteligencia;
  final double mana;
  final int afinidadeFogo;
  final int afinidadeAgua;
  final int afinidadeTerra;
  final int afinidadeAr;
  final String feitico1;
  final String feitico2;
  final String feitico3;

  Mago({
    required this.nome,
    required this.idade,
    required this.nivelMagico,
    required this.inteligencia,
    required this.mana,
    required this.afinidadeFogo,
    required this.afinidadeAgua,
    required this.afinidadeTerra,
    required this.afinidadeAr,
    required this.feitico1,
    required this.feitico2,
    required this.feitico3,
  });

  factory Mago.fromJson(Map<String, dynamic> json) {
    return Mago(
      nome: json['nome'],
      idade: json['idade'],
      nivelMagico: json['nivelMagico'],
      inteligencia: json['inteligencia'].toDouble(),
      mana: json['mana'].toDouble(),
      afinidadeFogo: json['afinidadeFogo'],
      afinidadeAgua: json['afinidadeAgua'],
      afinidadeTerra: json['afinidadeTerra'],
      afinidadeAr: json['afinidadeAr'],
      feitico1: json['feitico1'],
      feitico2: json['feitico2'],
      feitico3: json['feitico3'],
    );
  }
}
