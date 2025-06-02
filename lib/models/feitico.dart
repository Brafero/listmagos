import 'package:json_annotation/json_annotation.dart';

part 'feitico.g.dart';

@JsonSerializable()
class Feitico {
  final String nome;
  final String descricao;
  final String elemento;

  Feitico({
    required this.nome,
    required this.descricao,
    required this.elemento,
  });

  factory Feitico.fromJson(Map<String, dynamic> json) =>
      _$FeiticoFromJson(json);
  Map<String, dynamic> toJson() => _$FeiticoToJson(this);
}
