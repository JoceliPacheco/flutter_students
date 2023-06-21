import 'package:flutter_students/src/helpers/transformers.dart';
import 'package:json_annotation/json_annotation.dart';

part 'student.g.dart';

@JsonSerializable(createToJson: true)
class Student {
  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'nome')
  String name;

  @JsonKey(name: 'email')
  String email;

  @JsonKey(name: 'senha')
  String password;

  @JsonKey(name: 'situacao', fromJson: dynamicToBool)
  bool active;

  @JsonKey(name: 'telefone')
  String phone;

  @JsonKey(name: 'valor_mensalidade', fromJson: dynamicToDouble)
  double value;

  @JsonKey(name: 'observacao')
  String observation;

  Student({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.active,
    required this.phone,
    required this.value,
    required this.observation,
  });

  static List<Student> fromList(List<dynamic> list) {
    return list.map((map) => Student.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() => _$StudentToJson(this);

  factory Student.fromJson(Map<String, dynamic> map) => _$StudentFromJson(map);
}
