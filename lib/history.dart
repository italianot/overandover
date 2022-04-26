import 'package:flutter/material.dart';
import 'homePage.dart';


class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Widget header = Row(
      children: <Widget>[Align(
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
            ),],
    );

    Widget returnSection1 = Column(
      children:  const <Widget>[
        
        



        ListTile(
        leading: Icon(Icons.light,
            color: Color.fromARGB(255, 219, 145, 8)),
        title: Text("Электроэнергия"),
        subtitle: Text("Способ: по телефону \nПоказания: 4752 кВт.ч. \nРасход: 82 кВт.ч."),
        isThreeLine: true,
        dense: false,
        ),
        ListTile(
        leading: Icon(Icons.light,
            color: Color.fromARGB(255, 219, 145, 8)),
        title: Text("Электроэнергия"),
        subtitle: Text("Способ: по телефону \nПоказания: 4800 кВт.ч. \nРасход: 100 кВт.ч."),
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
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 10),
              child: returnSection1, 
            ),
          ],
        ),
      ),
    );
  }
}

