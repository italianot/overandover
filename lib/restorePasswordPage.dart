import 'package:flutter/material.dart';
import 'package:overandover/main.dart';

class RestorePasswordPage extends StatefulWidget {
  const RestorePasswordPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RestorePasswordState();
}

class _RestorePasswordState extends State<RestorePasswordPage> {
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

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
                    MaterialPageRoute(builder: (context) => const MyApp()),
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
              controller: myController,
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
            onPressed: () {
              showDialog<String>(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('Восстановление пароля.'),
                  content: Text('На указанный элетронный адрес - '
                      '(${myController.text}) придет письмо с '
                      'инструкцией для восстановления пароля'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MyApp()));
                      },
                      child: const Text('Ок'),
                    ),
                  ],
                ),
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
            inputSection,
            buttonSection,
          ],
        ),
      ),
    );
  }
}
