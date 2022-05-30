import 'package:flutter/material.dart';
import 'package:overandover/menu.dart';
import 'package:overandover/rest_api.dart';
import 'menu.dart';

var newSurname;
var newName;
var newMiddleName;
var newPhoneNumber;

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  bool isEnabled = false;
  bool isVisible = false;

  var fullName = client[0]['Surname'].toString() +
      ' ' +
      client[0]['Name'].toString() +
      ' ' +
      client[0]['MiddleName'].toString();

  // void transformNameIntoArray() {
  //   var z = newFullName.toString();
  //   var splitted = z.split(' ');
  //   print(splitted[1]);
  // }

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
          Visibility(
            visible: !isVisible,
            child: Container(
              margin: const EdgeInsets.all(10),
              child: Table(
                columnWidths: const {
                  0: FlexColumnWidth(0.8),
                  1: FlexColumnWidth(2.2)
                },
                border: const TableBorder(
                    verticalInside: BorderSide(
                        width: 1,
                        color: Colors.blue,
                        style: BorderStyle.solid)),
                children: [
                  // TableRow(children: [
                  //   const Padding(
                  //     padding: EdgeInsets.only(left: 10, top: 5),
                  //     child: Text('ФИО', textAlign: TextAlign.left),
                  //   ),
                  //   Padding(
                  //     padding: const EdgeInsets.only(left: 10, top: 5),
                  //     child:
                  //         TextField(
                  //           enabled: isEnabled,
                  //           onSubmitted: (text) {
                  //             newFullName = text;
                  //           },
                  //         ),
                  //   ),
                  // ]),

                  TableRow(children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 10, top: 5),
                      child: Text('ФИО', textAlign: TextAlign.left),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 5),
                      child:
                          // TextField(
                          //   enabled: isEnabled,
                          //   onSubmitted: (text) {
                          //     newFullName = text;
                          //   },
                          // ),

                          Text(fullName,
                              textAlign: TextAlign.left,
                              style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10, top: 5),
                      child: Text('Телефон', textAlign: TextAlign.left),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10, top: 5),
                      child: Text(client[0]['PhoneNumber'].toString(),
                          textAlign: TextAlign.left,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10, top: 5),
                      child: Text('E-mail', textAlign: TextAlign.left),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10, top: 5),
                      child: Text(client[0]['Email'].toString(),
                          textAlign: TextAlign.left,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10, top: 5),
                      child: Text('Город', textAlign: TextAlign.left),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10, top: 5),
                      child: Text(client[0]['City'].toString(),
                          textAlign: TextAlign.left,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10, top: 5),
                      child: Text('Улица', textAlign: TextAlign.left),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10, top: 5),
                      child: Text(client[0]['Street'].toString(),
                          textAlign: TextAlign.left,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10, top: 5),
                      child: Text('Дом', textAlign: TextAlign.left),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10, top: 5),
                      child: Text(client[0]['HouseNumber'].toString(),
                          textAlign: TextAlign.left,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10, top: 5),
                      child: Text('Квартира', textAlign: TextAlign.left),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10, top: 5),
                      child: Text(client[0]['Flat'].toString(),
                          textAlign: TextAlign.left,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ]),
                ],
              ),
            ),
          ),
          Visibility(
            visible: isVisible,
            child: Container(
              margin: const EdgeInsets.all(10),
              child: Table(
                columnWidths: const {
                  0: FlexColumnWidth(0.8),
                  1: FlexColumnWidth(2.2)
                },
                border: const TableBorder(
                    verticalInside: BorderSide(
                        width: 1,
                        color: Colors.blue,
                        style: BorderStyle.solid)),
                children: [
                  TableRow(children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 10, top: 5),
                      child: Text('Фамилия', textAlign: TextAlign.left),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 5),
                      child: TextFormField(
                        initialValue: client[0]['Surname'].toString(),
                        decoration: InputDecoration(
                          hintText: 'Введите фамилию',
                        ),
                        maxLength: 20,
                        onFieldSubmitted: (text) {
                          newSurname = text;
                        },
                      ),
                    ),
                  ]),
                  TableRow(children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 10, top: 5),
                      child: Text('Имя', textAlign: TextAlign.left),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 5),
                      child: TextFormField(
                        initialValue: client[0]['Name'].toString(),
                        decoration: InputDecoration(
                          hintText: 'Введиет имя',
                        ),
                        maxLength: 20,
                        onFieldSubmitted: (text) {
                          newName = text;
                        },
                      ),
                    ),
                  ]),
                  TableRow(children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 10, top: 5),
                      child: Text('Отчество', textAlign: TextAlign.left),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 5),
                      child: TextFormField(
                        initialValue: client[0]['MiddleName'].toString(),
                        decoration: InputDecoration(
                          hintText: 'Введите отчество',
                        ),
                        maxLength: 20,
                        onFieldSubmitted: (text) {
                          newMiddleName = text;
                        },
                      ),
                    ),
                  ]),
                  TableRow(children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 10, top: 5),
                      child: Text('Телефон', textAlign: TextAlign.left),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 5),
                      child: TextFormField(
                        initialValue: client[0]['PhoneNumber'].toString(),
                        decoration: InputDecoration(
                          hintText: 'Пример: 89999999999',
                        ),
                        maxLength: 11,
                        onFieldSubmitted: (text) {
                          newPhoneNumber = text;
                        },
                      ),
                    ),
                  ]),
                ],
              ),
            ),
          ),
        ]),
        Visibility(
          visible: !isVisible,
          child: ListTile(
            leading:
                const Icon(Icons.edit, color: Color.fromARGB(255, 219, 145, 8)),
            title: const Text("Редактировать"),
            onTap: () {
              setState(() {
                isVisible = true;
                isEnabled = true;
              });
            },
          ),
        ),
        Visibility(
          visible: isVisible,
          child: ListTile(
            leading:
                const Icon(Icons.save, color: Color.fromARGB(255, 219, 145, 8)),
            title: const Text("Сохранить"),
            onTap: () {
              setState(() {
                isVisible = false;
                isEnabled = false;
              });
              //transformNameIntoArray();
            },
          ),
        ),
      ],
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter layout',
      home: Scaffold(
        body: ListView(
          children: [header, body],
        ),
      ),
    );
  }
}
