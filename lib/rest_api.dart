import 'dart:convert';

import 'package:http/http.dart' as http;

class URLS {
  static const String BASE_URL = 'http://dummy.restapiexample.com/api/v1';
}

class ApiService {
  // RESPONSE JSON :
  // [{
  // "id": "6",
  // "user_id":"0",
  // "Surname":"Алексеев",
  // "Name":"Алексей",
  // "MiddleName":"Алексеевич",
  // "PhoneNumber":"66666666777",
  // "Email":"ttt@gmail.com",
  // "City":"Irkutsk",
  // "Street":"Orlova",
  // "HouseNumber":"63",
  // "Flat":"4",
  // "Login":"555555"
  // },
  // {"id":"5",
  // "user_id":"0",
  // "Surname":"Сергеев",
  // "Name":"Сергей",
  // "MiddleName":"Сергеевич",
  // "PhoneNumber":"8888888888",
  // "Email":"sss@gmail.com",
  // "City":"Irkutsk",
  // "Street":"Paveletskaya",
  // "HouseNumber":"5",
  // "Flat":"1",
  // "Login":"44444",
  // },
  // ]
  static Future<List<dynamic>?> getPersonInfo() async {
    final response = await http.get('${URLS.BASE_URL}/client');
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return null;
    }
  }

  // [{
  // "id":"13",
  // "date":"2022-04-22",
  // "title":"Электронергия",
  // "send_type":"По компьютеру",
  // "indication":"4253",
  // "client_id":"4"
  // },
  // {
  // "id":"12",
  // "date":"2022-02-21",
  // "title":"Электронергия",
  // "send_type":"По компьютеру",
  // "indication":"7000",
  // "client_id":"4"
  // },
  // {"id":"11",
  // "date":"2022-02-17",
  // "title":"Электронергия",
  // "send_type":"По компьютеру",
  // "indication":"5800",
  // "client_id":"4"
  // },
  // ]
  static Future<List<dynamic>?> getHistory() async {
    final response = await http.get('${URLS.BASE_URL}/history');
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return null;
    }
  }

  static Future<bool> addIndications(body) async {
    // BODY
    // {
    //   "name": "test",
    //   "age": "23"
    // }
    final response = await http.post('${URLS.BASE_URL}/create', body: body);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
