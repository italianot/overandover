import 'package:json_annotation/json_annotation.dart';
part 'post.g.dart';


@JsonSerializable()
class Post {
  // @JsonKey() //при не совпадении ключей
  String email;
  String password;
  String name;
  String surname;
  String middleName; //отчество
  String phoneNumber;
  String accountNumber;
  String city;
  String street;
  String house;
  String flat;
  String indications; //показания
  String consumption; //потребление

  Post(
      {required this.email,
      required this.password,
      required this.name,
      required this.surname,
      required this.middleName,
      required this.phoneNumber,
      required this.accountNumber,
      required this.city,
      required this.street,
      required this.house,
      required this.flat,
      required this.indications,
      required this.consumption});

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  Map<String, dynamic> toJson() => _$PostToJson(this);
}
