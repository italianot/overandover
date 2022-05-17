import 'package:flutter/material.dart';
import 'package:overandover/main.dart';

class RestorePasswordPage extends StatelessWidget {
  const RestorePasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget inputSection = Column(
      children: <Widget>[
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                },
                icon: const Icon(Icons.arrow_back)),
          ),
        ),
        Container(
            padding: const EdgeInsets.only(
                top: 150, left: 10, right: 10, bottom: 20),
            child: const Text("Укажите ваш email для восстановления пароля")),
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
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
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
