// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'history.dart';
import 'menu.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget iconButtons = Row(children: <Widget>[
      IconButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MenuPage()),
          );
        },
        icon: const Icon(Icons.person),
      ),
      IconButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HistoryPage()),
          );
        },
        icon: const Icon(Icons.view_headline),
      ),
    ]);

    Widget iconsAndText = Column(children: <Widget>[
      const ListTile(
        leading: Icon(Icons.light, color: Color.fromARGB(255, 219, 145, 8)),
        title: Text("Электроэнергия"),
        dense: false,
      ),
      const ListTile(
        leading: Icon(Icons.electrical_services,
            color: Color.fromARGB(255, 219, 145, 8)),
        title: Text("Ваши приборы учета"),
        dense: true,
      ),
      Column(
        //счетчик
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Image.asset(
                  'assets/images/counter.jpg',
                  width: 100,
                  height: 50,
                )),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('Счетчик CE303 R33'),
            ),
          )
        ],
      ),
      const ListTile(
        title: Text("Передача новых показаний"),
      ),
      const ListTile(
        leading: Icon(Icons.warning, color: Color.fromARGB(255, 219, 145, 8)),
        subtitle: Text(
          'Рекомендуем передавать показания приборов учета до 25 числа. Показания преданные после 25 числа, не будут приняты к расчету в этом месяце.',
          softWrap: true,
        ),
        isThreeLine: true,
      ),
      const ListTile(
        title: Text("Текущий расход: 5447 кВ.ч."),
        dense: true,
      ),
      RaisedButton(
        child: const Text("Загрузить фото"),
        onPressed: () {},
      ),
      const Padding(
        padding: EdgeInsets.only(top: 8, left: 20, right: 20, bottom: 0),
        child: Text('или'),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 0, left: 20, right: 20, bottom: 5),
        child: TextFormField(),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: RaisedButton(
          child: const Text("Передать показания"),
          onPressed: () {},
        ),
      ),
    ]);

    return MaterialApp(
      title: 'Flutter layout',
      home: Scaffold(
        body: ListView(
          children: [iconButtons, iconsAndText],
        ),
      ),
    );
  }
}
