// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) {
  return Post(
    email: json['email'] as String,
    password: json['password'] as String,
    name: json['name'] as String,
    surname: json['surname'] as String,
    middleName: json['middleName'] as String,
    phoneNumber: json['phoneNumber'] as String,
    accountNumber: json['accountNumber'] as String,
    city: json['city'] as String,
    street: json['street'] as String,
    house: json['house'] as String,
    flat: json['flat'] as String,
    indications: json['indications'] as String,
    consumption: json['consumption'] as String,
  );
}

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'name': instance.name,
      'surname': instance.surname,
      'middleName': instance.middleName,
      'phoneNumber': instance.phoneNumber,
      'accountNumber': instance.accountNumber,
      'city': instance.city,
      'street': instance.street,
      'house': instance.house,
      'flat': instance.flat,
      'indications': instance.indications,
      'consumption': instance.consumption,
    };
