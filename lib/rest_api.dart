import 'package:overandover/post.dart';
//import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';



class ApiHistory {
  final client = HttpClient();

  Future<Post?> createPost(
      {
        required String title, required String body}) async {
        final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
        final parameters = <String, dynamic>{
        'title': title,
        'body': body,
        'userId': 500
      };
    final request = await client.postUrl(url);
    request.headers.set('Content-type', 'application/json; charset=UTF-8');//ожидаемые header'ы
    request.write(jsonEncode(parameters));
    final response = await request.close();
    final jsonStrings = await response.transform(utf8.decoder).toList();
    final jsonString = jsonStrings.join();
    final json = jsonDecode(jsonString) as Map<String, dynamic>;
    final post = Post.fromJson(json);
    return post;
  }

  Future<List<Post>> getHistory() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');//подготовка url
    final request = await client.getUrl(url);//делаем request
    final response = await request.close();//отправляем в сеть и ждем ответ 
    //преобразование ответа в посты
    final jsonStrings = await response.transform(utf8.decoder).toList();
    final jsonString = jsonStrings.join();
    final json = jsonDecode(jsonString) as List<dynamic>;

    final posts = json
        .map((dynamic e) => Post.fromJson(e as Map<String, dynamic>))
        .toList();
    return posts;
  }
}





 

// import 'dart:convert';
// import 'dart:io';
// import 'package:http/http.dart' as http;
// import 'package:overandover/post.dart';

// class ApiService {
//   static Future<List<dynamic>?> getEmployees() async {
//     var client = http.Client();
//     var uri = Uri.parse("http://electricity.tealeaf.su/api/history");
//     var response = await client.get(uri);
//     if (response.statusCode == 200) {
//       return json.decode(response.body);
//     } else {
//       return null;
//     }
//   }

//   // static Future<bool> addEmployee(body) async {
//   //   final response = await http.post("${URLS.BASE_URL}/create", body: body);
//   //   if (response.statusCode == 200) {
//   //     return true;
//   //   } else {
//   //     return false;
//   //   }
//   // }
// }









// class ApiService {
//   // RESPONSE JSON :
//   // [{
//   // "id": "6",
//   // "user_id":"0",
//   // "Surname":"Алексеев",
//   // "Name":"Алексей",
//   // "MiddleName":"Алексеевич",
//   // "PhoneNumber":"66666666777",
//   // "Email":"ttt@gmail.com",
//   // "City":"Irkutsk",
//   // "Street":"Orlova",
//   // "HouseNumber":"63",
//   // "Flat":"4",
//   // "Login":"555555"
//   // },
//   // {"id":"5",
//   // "user_id":"0",
//   // "Surname":"Сергеев",
//   // "Name":"Сергей",
//   // "MiddleName":"Сергеевич",
//   // "PhoneNumber":"8888888888",
//   // "Email":"sss@gmail.com",
//   // "City":"Irkutsk",
//   // "Street":"Paveletskaya",
//   // "HouseNumber":"5",
//   // "Flat":"1",
//   // "Login":"44444",
//   // },
//   // {"id":"4",
//   //"user_id":"2",
//   //"Surname":"Романов",
//   //"Name":"Игорь",
//   //"MiddleName":"Романович",
//   //"PhoneNumber":"77777777777777",
//   //"Email":"llll@gmail.com",
//   //"City":"Irkutsk",
//   //"Street":"Uritskogo",
//   //"HouseNumber":"8",
//   //"Flat":"2",
//   //"NumberRooms":"1",
//   //"NumberTenats":"1",
//   //"Login":"3333333",
//   //"created_at":"2021-05-02 14:49:42",
//   //"updated_at":"2022-04-22 04:34:10"
//   //},
//   // {"id":"3","user_id":"0","Surname":"Иванов","Name":"Иван","MiddleName":"Иванович",
//   "PhoneNumber":"6666666666","Email":"hhhh@gmail.com","City":"Irkutsk","Street":"Igoshina",
//   "HouseNumber":"6","Flat":"1","NumberRooms":"2","NumberTenats":"2","Login":"22222",
//   "created_at":"2011-12-01 14:53:16","updated_at":"2021-12-21 14:53:16"},
//   // ]
//   static Future<List<dynamic>?> getPersonInfo() async {
//     final response = await http.get(Uri.http(URLS.baseURL, 'clients'));
//     if (response.statusCode == 200) {
//       return json.decode(response.body);
//     } else {
//       return null;
//     }
//   }

//   // [{
//   // "id":"13",
//   // "date":"2022-04-22",
//   // "title":"Электронергия",
//   // "send_type":"По компьютеру",
//   // "indication":"4253",
//   // "client_id":"4"
//   // },
//   // {
//   // "id":"12",
//   // "date":"2022-02-21",
//   // "title":"Электронергия",
//   // "send_type":"По компьютеру",
//   // "indication":"7000",
//   // "client_id":"4"
//   // },
//   // {"id":"11",
//   // "date":"2022-02-17",
//   // "title":"Электронергия",
//   // "send_type":"По компьютеру",
//   // "indication":"5800",
//   // "client_id":"4"
//   // },
//   // ]
//   static Future<List<dynamic>?> getHistory() async {
//     final response = await http.get(Uri.http(URLS.baseURL, 'history'));  
//     if (response.statusCode == 200) {
//       return json.decode(response.body);
//     } else {
//       return null;
//     }
//   }

//   static Future<bool> addIndications(body) async {
//     // BODY
//     // {
//     //   "name": "test",
//     //   "age": "23"
//     // }
//     final response = await http.post('${URLS.baseURL}/create', body: body);
//     if (response.statusCode == 200) {
//       return true;
//     } else {
//       return false;
//     }
//   }
// }
