// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Todo _$TodoFromJson(Map<String, dynamic> json) {
  return Todo(
    json['id'] as int,
    json['description'] as String,
    json['date'] as String,
    json['status'] as int,
  );
}

Map<String, dynamic> _$TodoToJson(Todo instance) => <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'date': instance.date,
      'status': instance.status,
    };
