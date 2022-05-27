import 'package:dio/dio.dart';

import 'homePage.dart';

Dio dio = Dio();

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
    if (apidata["data"][i]['client_id'] == 4) {
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
  Response response = await dio.get('http://electricity.tealeaf.su/api/client');
  var apidata = response.data; //get JSON decoded data from response

  for (int i = 0; i < apidata["data"].length; i++) {
    if (apidata["data"][i]['id'] == 4) {
      client.add(apidata["data"][i]);
      //print(client);
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
  todaysDate = date.toString().replaceAll("00:00:00.000", "");
  var delta = int.parse(newIndication) - int.parse(lastIndication);
  Response response =
      await dio.post('http://electricity.tealeaf.su/api/history', data: {
    'id': newIndicationId,
    'date': todaysDate,
    'send_type': 'По телефону',
    'indication': newIndication,
    'client_id': '4',
    'title': 'Электроэнергия',
    'delta': delta
  });
  //id: 7, date: 2021-12-22, send_type: По компьютеру, indication: 400, client_id: 4, title: Электронергия, delta: 400
}
