import 'package:flutter/material.dart';
import 'package:overandover/main.dart';


class RestorePasswordPage extends StatelessWidget {
  const RestorePasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget inputSection = Column(
      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        IconButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const HomeScreen()),
              );
          },
          icon: const Icon(Icons.arrow_back)
        ),
        
        Container(
            padding: const EdgeInsets.only(
                top: 150, left: 10, right: 10, bottom: 20),
            child: const Text("Укажите ваш email для восстановления пароля",
                textDirection: TextDirection.ltr, // текст слева направо
                textAlign: TextAlign.center, // выравнивание по центру
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 26, // высота шрифта 26
                ))),
        Padding(
          padding:
              const EdgeInsets.only(top: 0, left: 20, right: 20, bottom: 30),
          child: TextFormField(
              decoration: const InputDecoration(hintText: 'Введите ваш email'),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Пожалуйста, введиет ваш email';
                }
                return null;
              }),
        ),
      ],
    );

    Widget buttonSection = Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: RaisedButton(
            child: const Text("Восстановить"),
            onPressed: () {},
          ),
        ),
      ],
    );

    return MaterialApp(
      title: 'Flutter layout',
      home: Scaffold(
        body: ListView(
          children: [
            inputSection,
            buttonSection,
          ],
        ),
      ),
    );
  }
}
