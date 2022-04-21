import 'package:flutter/material.dart';
import 'package:overandover/menu.dart';
import 'menu.dart';


class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header = Column(
      children: <Widget>[
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MenuPage()),
            );
          },
          icon: Image.asset('lib/assets/images/user.png'),
          iconSize: 8,
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Личные данные'),
        )
      ],
    );

    Widget body = Column(
      children:  <Widget>[
         
        Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              Container(
                margin: const EdgeInsets.all(10),
                child: Table(
                  border: const TableBorder(
                    verticalInside: BorderSide(
                      width: 1, 
                      color: Colors.blue, 
                      style: BorderStyle.solid)),
                  children: const [
                    TableRow(children: [
                      Text('ФИО', textAlign: TextAlign.center),
                      Padding(
                        padding: EdgeInsets.only(top: 0, left: 10, right: 0, bottom: 0),
                        child: Text('Белов Никита Андреевич', textAlign: TextAlign.left, style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ]),
                    TableRow(children: [
                      Text('Телефон', textAlign: TextAlign.center),
                      Padding(
                        padding: EdgeInsets.only(top: 0, left: 10, right: 0, bottom: 0),
                        child: Text('89277077000', textAlign: TextAlign.left, style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ]),
                    TableRow(children: [
                      Text('E-mail', textAlign: TextAlign.center),
                      Padding(
                        padding: EdgeInsets.only(top: 0, left: 10, right: 0, bottom: 0),
                        child: Text('n@mail.ru', textAlign: TextAlign.left, style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ]),
                    TableRow(children: [
                      Text('Город', textAlign: TextAlign.center),
                      Padding(
                        padding: EdgeInsets.only(top: 0, left: 10, right: 0, bottom: 0),
                        child: Text('Иркутск', textAlign: TextAlign.left, style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ]),
                    TableRow(children: [
                      Text('Улица', textAlign: TextAlign.center),
                      Padding(
                        padding: EdgeInsets.only(top: 0, left: 10, right: 0, bottom: 0),
                        child: Text('Байкальская', textAlign: TextAlign.left, style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ]),
                    TableRow(children: [
                      Text('Дом', textAlign: TextAlign.center),
                      Padding(
                        padding: EdgeInsets.only(top: 0, left: 10, right: 0, bottom: 0),
                        child: Text('123а/4', textAlign: TextAlign.left, style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ]),
                    TableRow(children: [
                      Text('Квартира', textAlign: TextAlign.center),
                      Padding(
                        padding: EdgeInsets.only(top: 0, left: 10, right: 0, bottom: 0),
                        child: Text('56', textAlign: TextAlign.left, style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ]),
                  ],
                ),
              ),
            ]),
            ElevatedButton(
          child: const Text("Редактировать"),
          onPressed: () {},
        ),
        
      ],
    );




    
    
    return MaterialApp(
      title: 'Flutter layout',
      home: Scaffold(
        body: ListView(
          children: [
            header,
            body
            
          ],
        ),
      ),
    );
  }
}