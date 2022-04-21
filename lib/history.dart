import 'package:flutter/material.dart';
import 'homePage.dart';


class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Widget returnSection1 = Column(
      children:  <Widget>[
        IconButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const HomePage()),
              );
          },
          icon: const Icon(Icons.arrow_back)
        ),
        const Padding( 
              padding: EdgeInsets.all(8.0),
              child: Text('История'),
            ),
            
        Row(
          children:  <Widget>[
            const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.electrical_services,
              color: Color.fromARGB(255, 219, 145, 8),
              size: 24.0,
              semanticLabel: 'Text to announce in accessibility modes',
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: const <Widget>[
                Padding(
                padding: EdgeInsets.only(top: 8, left: 0, right: 8, bottom: 8),
                child: Text('Электроэнергия'),
              ),
              Padding(
                padding: EdgeInsets.only(top: 8, left: 0, right: 8, bottom: 8),
                child: Text('По телефону'),
              )
              ]
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: const <Widget>[
                Padding(
                padding: EdgeInsets.only(top: 8, left: 0, right: 8, bottom: 8),
                child: Text('Показания: 4752 кВт.ч'),
              ),
              Padding(
                padding: EdgeInsets.only(top: 8, left: 0, right: 8, bottom: 8),
                child: Text('Расход: 82 кВт.ч'),
              )
              ]
            ),
          ),
          
          ],
        ),



      ],
    );

    Widget returnSection2 = Column(
      children:  <Widget>[
          
        Row(
          children:  <Widget>[
            const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.electrical_services,
              color: Color.fromARGB(255, 219, 145, 8),
              size: 24.0,
              semanticLabel: 'Text to announce in accessibility modes',
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: const <Widget>[
                Padding(
                padding: EdgeInsets.only(top: 8, left: 0, right: 8, bottom: 8),
                child: Text('Электроэнергия'),
              ),
              Padding(
                padding: EdgeInsets.only(top: 8, left: 0, right: 8, bottom: 8),
                child: Text('По телефону'),
              )
              ]
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: const <Widget>[
                Padding(
                padding: EdgeInsets.only(top: 8, left: 0, right: 8, bottom: 8),
                child: Text('Показания: 4752 кВт.ч'),
              ),
              Padding(
                padding: EdgeInsets.only(top: 8, left: 0, right: 8, bottom: 8),
                child: Text('Расход: 82 кВт.ч'),
              )
              ]
            ),
          ),
          
          ],
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
              child: returnSection1, 
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 10),
              child: returnSection2, 
            ),
            
          ],
        ),
      ),
    );
  }
}

