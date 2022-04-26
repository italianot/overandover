import 'package:flutter/material.dart';
import 'package:overandover/menu.dart';
import 'menu.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

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
                    MaterialPageRoute(builder: (context) => const MenuPage()),
                  );
                },
                icon: const Icon(Icons.arrow_back)),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Личные данные', style: TextStyle(fontSize: 20)),
        )
      ],
    );

    Widget body = Column(
      children: <Widget>[
        Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Container(
            margin: const EdgeInsets.all(10),
            child: Table(
              columnWidths: const {
                0: FlexColumnWidth(5),
                1: FlexColumnWidth(15)
              },
              border: const TableBorder(
                  verticalInside: BorderSide(
                      width: 1, color: Colors.blue, style: BorderStyle.solid)),
              children: const [
                TableRow(children: [
                  Text('ФИО', textAlign: TextAlign.center),
                  Padding(
                    padding:
                        EdgeInsets.only(top: 0, left: 10, right: 0, bottom: 0),
                    child: Text('Белов Никита Андреевич',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ]),
                TableRow(children: [
                  Text('Телефон', textAlign: TextAlign.center),
                  Padding(
                    padding:
                        EdgeInsets.only(top: 0, left: 10, right: 0, bottom: 0),
                    child: Text('89277077000',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ]),
                TableRow(children: [
                  Text('E-mail', textAlign: TextAlign.center),
                  Padding(
                    padding:
                        EdgeInsets.only(top: 0, left: 10, right: 0, bottom: 0),
                    child: Text('n@mail.ru',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ]),
                TableRow(children: [
                  Text('Город', textAlign: TextAlign.center),
                  Padding(
                    padding:
                        EdgeInsets.only(top: 0, left: 10, right: 0, bottom: 0),
                    child: Text('Иркутск',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ]),
                TableRow(children: [
                  Text('Улица', textAlign: TextAlign.center),
                  Padding(
                    padding:
                        EdgeInsets.only(top: 0, left: 10, right: 0, bottom: 0),
                    child: Text('Байкальская',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ]),
                TableRow(children: [
                  Text('Дом', textAlign: TextAlign.center),
                  Padding(
                    padding:
                        EdgeInsets.only(top: 0, left: 10, right: 0, bottom: 0),
                    child: Text('123а/4',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ]),
                TableRow(children: [
                  Text('Квартира', textAlign: TextAlign.center),
                  Padding(
                    padding:
                        EdgeInsets.only(top: 0, left: 10, right: 0, bottom: 0),
                    child: Text('56',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ]),
              ],
            ),
          ),
        ]),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          child: const Text("Редактировать"),
          onPressed: () {},
        ),
      ],
    );

    return MaterialApp(
      title: 'Flutter layout',
      home: Scaffold(
        body: ListView(
          children: [header, body],
        ),
      ),
    );
  }
}
