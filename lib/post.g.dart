// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) {
  return Post(
    userId: json['userId'] as int,
    title: json['title'] as String,
    body: json['body'] as String,
    id: json['id'] as String,
    date: json['date'] as String,
    sendType: json['sendType'] as String,
    indication: json['indication'] as int,
    clientId: json['clientId'] as String,
  );
}

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'userId': instance.userId,
      'title': instance.title,
      'body': instance.body,
      'id': instance.id,
      'date': instance.date,
      'sendType': instance.sendType,
      'indication': instance.indication,
      'clientId': instance.clientId,
    };
