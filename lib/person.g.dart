// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Person _$PersonFromJson(Map<String, dynamic> json) {
  return Person(
    email: json['email'] as String,
    password: json['password'] as String,
    name: json['name'] as String,
    surname: json['surname'] as String,
    patronymic: json['patronymic'] as String,
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

Map<String, dynamic> _$PersonToJson(Person instance) => <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'name': instance.name,
      'surname': instance.surname,
      'patronymic': instance.patronymic,
      'phoneNumber': instance.phoneNumber,
      'accountNumber': instance.accountNumber,
      'city': instance.city,
      'street': instance.street,
      'house': instance.house,
      'flat': instance.flat,
      'indications': instance.indications,
      'consumption': instance.consumption,
    };
