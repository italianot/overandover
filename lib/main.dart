import 'package:flutter/material.dart';
//import 'registerPage.dart';
import 'restorePasswordPage.dart';
import 'homePage.dart';

void main() {
  // debugPaintSizeEnabled = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomeScreen());
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget inputSection = Column(
      children: <Widget>[
        TextFormField(
            decoration: const InputDecoration(hintText: 'Укажите ваш email'),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Пожалуйста, укажите ваш email';
              }
              return null;
            }),
        TextFormField(
            decoration: const InputDecoration(hintText: 'Укажите ваш пароль'),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Пожалуйста, укажите ваш пароль';
              }
              return null;
            }),
      ],
    );

    Widget buttonSection = Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
          child: RaisedButton(
            child: const Text("Войти"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
          child: FlatButton(
            child: const Text("Забыли пароль?"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const RestorePasswordPage()),
              );
            },
          ),
        ),/*
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
          child: FlatButton(
            child: const Text("Зарегистрироваться"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RegisterPage()),
              );
            },
          ),
        ),*/
      ],
    );

    return MaterialApp(
      title: 'Flutter layout',
      home: Scaffold(
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 180, 8, 8),
              child: Align(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  'assets/images/counter.jpg',
                  width: 600,
                  height: 240,
                  fit: BoxFit.cover,
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
