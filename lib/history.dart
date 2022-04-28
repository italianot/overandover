import 'package:flutter/material.dart';
import 'package:overandover/post.dart';
import 'homePage.dart';

class HistoryPage extends StatelessWidget {
  final Post post;

  const HistoryPage(this.post, {Key? key}) : super(key: key);

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
          child: Text('История показаний', 
          style: TextStyle(
            fontSize: 20
            )
          ),
        ),
      ],
    );

    Widget returnSection1 = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // Container(
        //   margin: const EdgeInsets.all(10),
        //     child: Table(
        //       columnWidths: const {
        //         0: FlexColumnWidth(1),
        //         1: FlexColumnWidth(2)
        //       },
        //       border: const TableBorder(
        //           verticalInside: BorderSide(
        //               width: 1, color: Colors.blue, style: BorderStyle.solid)),
        //       children: const [
        //         TableRow(children: [
        //           Padding(
        //             padding: EdgeInsets.only(left: 55, top: 5),
        //             child: Text('Электроэнергия', textAlign: TextAlign.left),
        //           ),
        //           Padding(
        //             padding:
        //                 EdgeInsets.only(left: 10, top: 5),
        //             child: Text('Показания: 4752 кВт.ч.',
        //                 textAlign: TextAlign.left,
        //                 style: TextStyle(fontWeight: FontWeight.bold)),
        //           ),
        //         ]),
        //         TableRow(children: [
        //           Padding(
        //             padding: EdgeInsets.only(left: 55, top: 5),
        //             child: Text('Способ: по телефону', textAlign: TextAlign.left),
        //           ),
        //           Padding(
        //             padding:
        //                 EdgeInsets.only(left: 10, top: 5),
        //             child: Text('Расход: 82 кВт.ч.',
        //                 textAlign: TextAlign.left,
        //                 style: TextStyle(fontWeight: FontWeight.bold)),
        //           ),
        //         ]),
        //       ],
        //     ),
        // ),

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
                    child: Text("Показания: " + post.indications.toString(),
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
