// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Note _$NoteFromJson(Map<String, dynamic> json) {
  return Note(
    json['title'] as String,
    json['description'] as String,
    json['date'] as String,
  );
}

Map<String, dynamic> _$NoteToJson(Note instance) => <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'date': instance.date,
    };
