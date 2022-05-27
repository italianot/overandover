import 'package:dio/dio.dart';

Dio dio = Dio();

List<dynamic> ai = [];
List<dynamic> client = [];
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
  ai = List.of(ai.reversed);
  print(ai);
}

void getClientInfo() async {
  Response response = await dio.get('http://electricity.tealeaf.su/api/client');
  var apidata = response.data; //get JSON decoded data from response
  
  for (int i = 0; i < apidata["data"].length; i++) {
    if (apidata["data"][i]['id'] == 4) {
      client.add(apidata["data"][i]);
      print(client);
    }
  }
}
