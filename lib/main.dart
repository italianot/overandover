import 'package:flutter/material.dart';
import 'restorePasswordPage.dart';
import 'homePage.dart';

void main() {
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
