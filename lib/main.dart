import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:overandover/rest_api.dart';
import 'accountPage.dart';
import 'history.dart';
import 'menu.dart';
import 'restorePasswordPage.dart';
import 'homePage.dart';
import 'package:email_validator/email_validator.dart';

String p =
    "[a-zA-Z0-9+.\_\%-+]{1,256}@[a-zA-Z0-9][a-zA-Z0-9-]{0,64}(.[a-zA-Z0-9][a-zA-Z0-9-]{0,25})+";

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
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
  String _errorMessage = '';
  void validateEmail(String val) {
    if (val.isEmpty) {
      setState(() {
        _errorMessage = "Email не может быть пустым!";
      });
    } else if (!EmailValidator.validate(val, true)) {
      setState(() {
        _errorMessage = "Неверный адрес электронной почты!";
      });
    } else {
      setState(() {
        _errorMessage = "";
        login = val;
      });
    }
  }

  // void auth(context) {
  //   if (login == 'login' && password == 'pass') {
  //     print(login);
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(builder: (context) => const HomePage()),
  //     );
  //   } else {
  //     print('daaa');

  //   }
  // }
  // void postDATA() async {
  //   Dio dio = Dio();
  //   final response =
  //       await dio.post("http://electricity.tealeaf.su/login", data: {
  //     "email": "m@mail.ru", //login
  //     "password": "123", //password
  //   });
  //   print(response);
  // }

  @override
  Widget build(BuildContext context) {
    Widget inputSection = Column(
      children: <Widget>[
        TextFormField(
          decoration: const InputDecoration(hintText: 'Укажите ваш email'),
          onChanged: (enteredData) {
            validateEmail(enteredData);
            
          },
          // validator: (login) {
          //   if (login == null || login.isEmpty) {
          //     return 'Пожалуйста, укажите ваш email';
          //   }
          //   return login;
          // }
        ),
        TextFormField(
          obscureText: true,
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
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
          child: Text(
            _errorMessage,
            style: const TextStyle(color: Colors.red),
          ),
        ),
      ],
    );

    Widget buttonSection = Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
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

              if (login == 'm@mail.ru' && password == 'pass') {
                // m@mail.ru // 123
                print(login);
                print(password);
                Navigator.pushNamed(context, '/homePage');
                getHistory();
                getClientInfo();
              } else {
                showDialog<String>(
                  context: context,
                  barrierDismissible: true,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('Неверный логин или пароль.'),
                    // content: const Text(
                    //     ''),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Ок'),
                        child: const Text('Ок'),
                      ),
                    ],
                  ),
                );
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
