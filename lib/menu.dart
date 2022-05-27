import 'package:flutter/material.dart';
import 'package:overandover/rest_api.dart';
import 'homePage.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout',
      home: Scaffold(
        body: ListView(
          children: [
            Row(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()),
                          );
                        },
                        icon: const Icon(Icons.arrow_back)),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Меню', style: TextStyle(fontSize: 20)),
                )
              ],
            ),
            ListTile(
              leading: const Icon(Icons.person,
                  color: Color.fromARGB(255, 219, 145, 8)),
              title: Text(
                  client[0]['Surname'].toString() +
                      ' ' +
                      client[0]['Name'].toString() +
                      ' ' +
                      client[0]['MiddleName'].toString(),
                  style: const TextStyle(fontSize: 16)),
              dense: true,
            ),
            ListTile(
              leading: const Icon(Icons.assignment,
                  color: Color.fromARGB(255, 219, 145, 8)),
              title: Text(client[0]['Login'].toString(),
                  style: const TextStyle(fontSize: 16)),
              dense: true,
            ),
            ListTile(
              leading: const Icon(Icons.flag,
                  color: Color.fromARGB(255, 219, 145, 8)),
              title: Row(
                children: const [
                  Text("Напоминание"),
                ],
              ),
              onTap: null,
              trailing: const MyStatefulWidget(),
            ),
            ListTile(
              leading: const Icon(Icons.assignment_ind,
                  color: Color.fromARGB(255, 219, 145, 8)),
              title: const Text("Личная информация"),
              onTap: () {
                Navigator.pushNamed(context, '/accountPage');
              },
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app_rounded,
                  color: Color.fromARGB(255, 219, 145, 8)),
              title: const Text("Выход"),
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
            )
          ],
        ),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Switch(
        value: isSwitched,
        onChanged: (value) {
          setState(() {
            isSwitched = value;
            if (value == true) {
              showDialog<String>(
                context: context,
                barrierDismissible: true,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('Напоминание.'),
                  content: const Text('20 числа Вам придет сообщение с '
                      'напоминанием о необходимости передать '
                      'показания приборов до 25 числа текущего месяца.'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Ок'),
                      child: const Text('Ок'),
                    ),
                  ],
                ),
              );
            } else {
              showDialog<String>(
                context: context,
                barrierDismissible: true,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('Напоминание.'),
                  content: const Text('Функция напоминания отключена.'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Ок'),
                      child: const Text('Ок'),
                    ),
                  ],
                ),
              );
            }
          });
        });
  }
}
