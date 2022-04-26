import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:overandover/main.dart';
import 'accountPage.dart';
import 'homePage.dart';


class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header = Row(
      children: <Widget>[
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
              icon: const Icon(Icons.arrow_back)
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Меню',
          style: TextStyle(
                fontSize: 20
                )
          ),
        )
      ],
    );

    Widget body = Column(
      children: const <Widget>[
        ListTile(
        leading: Icon(Icons.person, color: Color.fromARGB(255, 219, 145, 8)),
        title: Text("Белов Никита Андреевич", style: TextStyle(fontSize: 16)),
        dense: true,
        ),

        ListTile(
        leading: Icon(Icons.assignment, color: Color.fromARGB(255, 219, 145, 8)),
        title: Text("Лицевой счет номер: 4586891", style: TextStyle(fontSize: 16)),
        dense: true,
        ),
      ],
    );

    Widget buttons = Column(
      children: <Widget>[
        Row(children: const <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Лицевые счета'),
          ),
          Padding(
              padding: EdgeInsets.fromLTRB(20, 8, 20, 8),
              child: MyStatefulWidget(),
            ),

        ]),
        
        Row(children:  <Widget>[
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Напоминание'),
          ),
          Switch(
            value: false, 
            dragStartBehavior: DragStartBehavior.start,
            onChanged: (bool value) {}
          )
        ]),
        
        
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            child: const Text("Личная информация"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AccountPage()),
              );
            },
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            child: const Text("Выход"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
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
            header,
            body,
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
      style: const TextStyle(color: Colors.blue),
      underline: Container(
        height: 2,
        width: 60,
        color: Colors.blue,
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
