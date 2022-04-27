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
                0: FlexColumnWidth(1),
                1: FlexColumnWidth(2)
              },
              border: const TableBorder(
                  verticalInside: BorderSide(
                      width: 1, color: Colors.blue, style: BorderStyle.solid)),
              children: const [
                TableRow(children: [
                  Padding(
                    padding: EdgeInsets.only(left: 55, top: 5),
                    child: Text('ФИО', textAlign: TextAlign.left),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 10, top: 5),
                    child: Text('Белов Никита Андреевич',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ]),
                TableRow(children: [
                  Padding(
                    padding: EdgeInsets.only(left: 55, top: 5),
                    child: Text('Телефон', textAlign: TextAlign.left),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 10, top: 5),
                    child: Text('89277077000',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ]),
                TableRow(children: [
                  Padding(
                    padding: EdgeInsets.only(left: 55, top: 5),
                    child: Text('E-mail', textAlign: TextAlign.left),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 10, top: 5),
                    child: Text('n@mail.ru',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ]),
                TableRow(children: [
                  Padding(
                    padding: EdgeInsets.only(left: 55, top: 5),
                    child: Text('Город', textAlign: TextAlign.left),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 10, top: 5),
                    child: Text('Иркутск',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ]),
                TableRow(children: [
                  Padding(
                    padding: EdgeInsets.only(left: 55, top: 5),
                    child: Text('Улица', textAlign: TextAlign.left),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 10, top: 5),
                    child: Text('Байкальская',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ]),
                TableRow(children: [
                  Padding(
                    padding: EdgeInsets.only(left: 55, top: 5),
                    child: Text('Дом', textAlign: TextAlign.left),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 10, top: 5),
                    child: Text('123а/4',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ]),
                TableRow(children: [
                  Padding(
                    padding: EdgeInsets.only(left: 55, top: 5),
                    child: Text('Квартира', textAlign: TextAlign.left),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 10, top: 5),
                    child: Text('56',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ]),
              ],
            ),
          ),
        ]),


        ListTile(
          leading: const Icon(Icons.edit, color: Color.fromARGB(255, 219, 145, 8)),
          title: const Text("Редактировать"),
          onTap: () {},
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
