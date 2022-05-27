import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:overandover/rest_api.dart';
import 'accountPage.dart';
import 'history.dart';
import 'menu.dart';
import 'restorePasswordPage.dart';
import 'homePage.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (contex) => MyApp(),
        '/homePage': (contex) => HomePage(),
        '/restorePage': (contex) => RestorePasswordPage(),
        '/menuPage': (contex) => MenuPage(),
        '/accountPage': (contex) => AccountPage(),
        '/historyPage': (contex) => HistoryPage(),
      },
    ));

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeScreen();
}

class _HomeScreen extends State<MyApp> {
  bool isButtonDisabled = false; // to enable enter button
  String login = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    void auth(context) {
      if (login == 'login' && password == 'pass') {
        print(login);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      } else {
        print('daaa');
      }
    }
    // void postDATA() async {
    //   Dio dio = Dio();
    //   final response =
    //       await dio.post("http://electricity.tealeaf.su/login", data: {
    //     "email": "m@mail.ru", //login
    //     "password": "123", //password
    //   });
    //   print(response);
    // }

    Widget inputSection = Column(
      children: <Widget>[
        TextFormField(
          decoration: const InputDecoration(hintText: 'Укажите ваш email'),
          onChanged: (String enteredData) {
            login = enteredData;
          },
          // validator: (login) {
          //   if (login == null || login.isEmpty) {
          //     return 'Пожалуйста, укажите ваш email';
          //   }
          //   return login;
          // }
        ),
        TextFormField(
          decoration: const InputDecoration(hintText: 'Укажите ваш пароль'),
          onChanged: (String enteredData) {
            password = enteredData;
          },
          // validator: (String? password) {
          //   if (password == null || password.isEmpty) {
          //     return 'Пожалуйста, укажите ваш пароль';
          //   }
          //   return null;
          // }
        ),
      ],
    );

    Widget buttonSection = Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(const Size(200, 40)),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            child: const Text("Войти"),
            onPressed: () {
              //postDATA();

              if (login == 'login' && password == 'pass') {
                // m@mail.ru // 123
                print(login);
                print(password);
                Navigator.pushNamed(context, '/homePage');
                getHistory();
                getClientInfo();
              } else {
                print('Неверный логин или пароль');
              }
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
          child: FlatButton(
            child: const Text("Забыли пароль?"),
            onPressed: () {
              Navigator.pushNamed(context, '/restorePage');
            },
          ),
        ),
      ],
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter layout',
      home: Scaffold(
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 30, 8, 8),
              child: Align(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  "images/logo.png",
                  width: 150,
                  height: 240,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 40),
              child: inputSection,
            ),
            buttonSection,
          ],
        ),
      ),
    );
  }
}
