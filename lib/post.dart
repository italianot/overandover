import 'dart:convert';

List<Post> postFromJson(String str) =>
    List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String postToJson(List<Post> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post {
  Post({
    required this.id,
    required this.date,
    required this.title,
    required this.sendType,
    required this.indication,
    required this.clientId,
  });

  String id;
  String date;
  String title;
  String sendType;
  int indication;
  String clientId;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["id"],
        date: json["date"],
        title: json["title"],
        sendType: json["send_type"],
        indication: json["indication"],
        clientId: json["client_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date": date,
        "title": title,
        "send_type": sendType,
        "indication": indication,
        "client_id": clientId,
      };
}
