// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Student _$StudentFromJson(Map<String, dynamic> json) => Student(
      id: json['id'] as String?,
      name: json['nome'] as String,
      email: json['email'] as String,
      password: json['senha'] as String,
      active: dynamicToBool(json['situacao']),
      phone: json['telefone'] as String?,
      value: dynamicToDouble(json['valor_mensalidade']),
      observation: json['observacao'] as String?,
    );

Map<String, dynamic> _$StudentToJson(Student instance) => <String, dynamic>{
      'id': instance.id,
      'nome': instance.name,
      'email': instance.email,
      'senha': instance.password,
      'situacao': instance.active,
      'telefone': instance.phone,
      'valor_mensalidade': instance.value,
      'observacao': instance.observation,
    };
