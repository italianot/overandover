import 'package:flutter/material.dart';
import 'package:overandover/post.dart';
import 'history_model.dart';
import 'homePage.dart';
import 'rest_api.dart';

class HistoryPage extends StatefulWidget {
  HistoryPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HistoryState();
}

  class _HistoryState extends State<HistoryPage> {
    final model = HistoryWidgetModel();

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
                icon: const Icon(Icons.arrow_back)),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('История показаний', style: TextStyle(fontSize: 20)),
        ),
      ],
    );

    Widget returnSection1 = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[

        ListTile(
          leading:
              const Icon(Icons.light, color: Color.fromARGB(255, 219, 145, 8)),
          title: const Text("2022-04-27"),
          subtitle: Container(
            margin: const EdgeInsets.only(top: 5),
            child: Table(
              children: [
                TableRow(children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Text("Электроэнергия", textAlign: TextAlign.left),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10, top: 5),
                    child: Text(" "/*"Показания: ${post.indication}"*/,
                        textAlign: TextAlign.left,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ]),
                TableRow(children: [
                  Padding(
                    padding: EdgeInsets.only(top: 5),
                    child:
                        Text('Способ: по телефону', textAlign: TextAlign.left),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10, top: 5),
                    child: Text("Расход: 82 кВт.ч.",
                        textAlign: TextAlign.left,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ]),
              ],
            ),
          ),
          isThreeLine: true,
          dense: false,
        ),
        ListTile(
          leading:
              const Icon(Icons.light, color: Color.fromARGB(255, 219, 145, 8)),
          title: const Text("2022-04-27"),
          subtitle: Container(
            margin: const EdgeInsets.only(top: 5),
            child: Table(
              children: [
                TableRow(children: [
                  Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Text('Электроэнергия', textAlign: TextAlign.left),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10, top: 5),
                    child: Text("Показания: 54848",
                        textAlign: TextAlign.left,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ]),
                TableRow(children: [
                  Padding(
                    padding: EdgeInsets.only(top: 5),
                    child:
                        Text('Способ: по телефону', textAlign: TextAlign.left),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10, top: 5),
                    child: Text("Расход: 82 кВт.ч.",
                        textAlign: TextAlign.left,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ]),
              ],
            ),
          ),
          isThreeLine: true,
          dense: false,
        ),
        ListTile(
          leading:
              const Icon(Icons.light, color: Color.fromARGB(255, 219, 145, 8)),
          title: const Text("2022-04-27"),
          subtitle: Container(
            margin: const EdgeInsets.only(top: 5),
            child: Table(
              children: [
                TableRow(children: [
                  Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Text('Электроэнергия', textAlign: TextAlign.left),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10, top: 5),
                    child: Text("Показания: ",
                        textAlign: TextAlign.left,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ]),
                TableRow(children: [
                  Padding(
                    padding: EdgeInsets.only(top: 5),
                    child:
                        Text('Способ: по телефону', textAlign: TextAlign.left),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10, top: 5),
                    child: Text("Расход: 82 кВт.ч.",
                        textAlign: TextAlign.left,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ]),
              ],
            ),
          ),
          isThreeLine: true,
          dense: false,
        ),
      ],
    );

    return MaterialApp(
      title: 'Flutter layout',
      home: Scaffold(
        body: ListView(
          children: [
            header,
            returnSection1,
          ],
        ),
      ),
    );
  }
}
