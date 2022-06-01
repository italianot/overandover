import 'package:dio/dio.dart';
import 'accountPage.dart';
import 'homePage.dart';

Dio dio = Dio();
var userID = 4;
List<dynamic> ai = [];
List<dynamic> client = [];
var lastIndication;
var lastIndicationId;
var newIndicationId = 0;
var todaysDate;
//bool loading = false;
// List<int> indications = []; //array for certain user's indications
// List<int> usage = [];

void getHistory() async {
  Response response =
      await dio.get('http://electricity.tealeaf.su/api/history');
  var apidata = response.data; //get JSON decoded data from response

  for (int i = 0; i < apidata["data"].length; i++) {
    if (apidata["data"][i]['client_id'] == userID) {
      ai.add(apidata["data"][i]);
    }
  }
  lastIndicationId = ai[ai.length - 1]["id"];
  print(lastIndicationId);
  newIndicationId = lastIndicationId + 1;
  print(newIndicationId);
  lastIndication = (ai[ai.length - 1]["indication"]);
  print(lastIndication);

  ai = List.of(ai.reversed);
  print(ai);
}

void getClientInfo() async {
  client.clear();
  Response response = await dio.get('http://electricity.tealeaf.su/api/client');
  var apidata = response.data; //get JSON decoded data from response

  for (int i = 0; i < apidata["data"].length; i++) {
    if (apidata["data"][i]['id'] == userID) {
      client.add(apidata["data"][i]);
    }
  }
}

void quickMath() {
  if (int.parse(newIndication) < int.parse(lastIndication)) {
    print('Неправильные показания');
    /////////////////////////////
  } else {
    print('Правильные показания');

    postNewIndication();
  }
}

void postNewIndication() async {
  DateTime now = DateTime.now();
  DateTime date = DateTime(now.year, now.month, now.day);
  var todaysDate =
      DateTime.parse(date.toString().replaceAll("00:00:00.000", ""));
  print(todaysDate);

  int newIndicationInt = newIndication;
  var delta = int.parse(newIndication) - int.parse(lastIndication);
  Response response =
      await dio.post('http://electricity.tealeaf.su/api/history', data: {
    'id': newIndicationId,
    'date': date,
    'send_type': 'По телефону',
    'indication': newIndicationInt,
    'client_id': userID,
    'title': 'Электроэнергия',
    'delta': delta
  });
}
//id: 7, date: 2021-12-22, send_type: По компьютеру, indication: 400, client_id: 4, title: Электронергия, delta: 400

void postNewClientInfo() async {
  Response response =
      await dio.put('http://electricity.tealeaf.su/api/client', data: {
    'id': client[0]['id'],
    'user_id': 2,
    'Surname': newSurname,
    'Name': newName,
    'MiddleName': newMiddleName,
    'PhoneNumber': newPhoneNumber,
  });
}

//[{id: 4, user_id: 2,
  //Surname: Романов, Name: Игорь,
  //MiddleName: Романович, PhoneNumber: 77777777777777,
  //Email: llll@gmail.com, City: Irkutsk,
  //Street: Uritskogo, HouseNumber: 8,
  //Flat: 2, Login: 3333333}]