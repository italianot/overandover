import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'post.g.dart';

List<Post> postFromJson(String str) =>
    List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String postToJson(List<Post> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@JsonSerializable()
class Post {
  Post({
    required this.userId,
    required this.title,
    required this.body,
    required this.id,
    required this.date,
    required this.sendType,
    required this.indication,
    required this.clientId,
  });

  final int userId;
  final String title;
  final String body;

  final String id;
  final String date;
  final String sendType;
  final int indication;
  final String clientId;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
  /*Post(
        id: json["id"],
        date: json["date"],
        title: json["title"],
        sendType: json["send_type"],
        indication: json["indication"],
        clientId: json["client_id"],
      );*/

  Map<String, dynamic> toJson() => _$PostToJson(this);
  /*{"id": id,
        "date": date,
        "title": title,
        "send_type": sendType,
        "indication": indication,
        "client_id": clientId,}*/

}
