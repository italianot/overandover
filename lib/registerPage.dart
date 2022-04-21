import 'package:flutter/material.dart';
import 'main.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget inputSection = Column(
      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
            padding: const EdgeInsets.only(
                top: 150, left: 10, right: 10, bottom: 20),
            child: const Text("Введите ваши данные",
                textDirection: TextDirection.ltr, // текст слева направо
                textAlign: TextAlign.center, // выравнивание по центру
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 26, // высота шрифта 26
                ))),
        TextFormField(
            decoration: const InputDecoration(hintText: 'Введите ваш логин'),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Пожалуйста, введите ваш логин';
              }
              return null;
            }),
        TextFormField(
            decoration: const InputDecoration(hintText: 'Введите ваш email'),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Пожалуйста, введите ваш email';
              }
              return null;
            }),
        TextFormField(
            decoration: const InputDecoration(hintText: 'Введите ваш пароль'),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Пожалуйста, введите ваш пароль';
              }
              return null;
            }),
        TextFormField(
            decoration:
                const InputDecoration(hintText: 'Введите ваш пароль снова'),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Пожалуйста, введите ваш пароль снова';
              }
              return null;
            }),
      ],
    );

    Widget buttonSection = Column(
      children: <Widget>[
        Padding(
          padding:
              const EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 5),
          child: RaisedButton(
            child: const Text("Зарегистрироваться"),
            onPressed: () {},
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(top: 0, left: 20, right: 20, bottom: 10),
          child: FlatButton(
            child: const Text("Вы уже зарегистрированы?"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MyApp()),
              );
            },
          ),
        ),
      ],
    );

    return MaterialApp(
      title: 'Flutter layout',
      home: Scaffold(
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 10),
              child: inputSection,
            ),
            buttonSection,
          ],
        ),
      ),
    );
  }
}
