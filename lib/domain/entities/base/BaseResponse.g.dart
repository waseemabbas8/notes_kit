// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BaseResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse<T> _$BaseResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object json) fromJsonT,
) {
  return BaseResponse<T>(
    statusCode: json['statusCode'] as int,
    message: json['message'] as String,
    data: fromJsonT(json['data']),
  );
}

Map<String, dynamic> _$BaseResponseToJson<T>(
  BaseResponse<T> instance,
  Object Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': toJsonT(instance.data),
    };
