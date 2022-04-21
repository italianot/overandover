import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:overandover/main.dart';
import 'accountPage.dart';
import 'homePage.dart';


class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header = Column(
      children: <Widget>[
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          },
          icon: const Icon(Icons.arrow_back)
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Меню'),
        )
      ],
    );

    Widget body = Column(
      children: const <Widget>[
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Белов Никита Андреевич'),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Лицевой счет номер: 4586891'),
        )
      ],
    );

    Widget buttons = Column(
      children: <Widget>[
        ElevatedButton(
          child: const Text("Личная информация"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AccountPage()),
            );
          },
        ),
        Row(children:  <Widget>[
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Напоминание'),
          ),
          Switch(
            value: true, 
            dragStartBehavior: DragStartBehavior.start,
            onChanged: (bool value) {}
          )
        ]),
        ElevatedButton(
          child: const Text("Выход"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          },
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
              child: header,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 10),
              child: body,
            ),
            const MyStatefulWidget(),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 10),
              child: buttons,
            ),
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
  String dropdownValue = '4586891';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_drop_down),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        width: 60,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <String>['4586891', '8418553']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
