import 'package:flutter/material.dart';
import 'rest_api.dart';
import 'dart:collection';

var newIndication;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

const List<String> counters = <String>[
  "Счетчик CE303 R33",
  "Меркурий",
  "Юпитер",
  "Рассвет",
  "Счетчик FX34 V2"
];
var active = Color.fromARGB(255, 219, 145, 8);
var defaultColor = Color.fromARGB(255, 139, 139, 139);
var activeElevation = 100;
var defaultElevation = 10;
List<dynamic> colors = <dynamic>[
  active,
  defaultColor,
  defaultColor,
  defaultColor,
  defaultColor
];
List<dynamic> cardElevation = <dynamic>[
  activeElevation,
  defaultElevation,
  defaultElevation,
  defaultElevation,
  defaultElevation
];

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget header = Row(children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/menuPage');
          },
          icon: const Icon(Icons.person),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/historyPage');
          },
          icon: const Icon(Icons.view_headline),
        ),
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
        dense: false,
      ),
      SizedBox(
        height: 200,
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: counters.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(
                    top: 8, left: 20, right: 20, bottom: 8),
                child: SizedBox(
                  width: 150,
                  height: 170,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        // print(counters[index]);
                        // print(colors);
                        if (colors[index] == active) {
                          colors[index] = active;
                          cardElevation[index] = activeElevation;
                        } else {
                          colors.clear();
                          colors.add(defaultColor);
                          colors.add(defaultColor);
                          colors.add(defaultColor);
                          colors.add(defaultColor);
                          colors.add(defaultColor);
                          colors[index] = active;
                          cardElevation.clear();
                          cardElevation.add(defaultElevation);
                          cardElevation.add(defaultElevation);
                          cardElevation.add(defaultElevation);
                          cardElevation.add(defaultElevation);
                          cardElevation.add(defaultElevation);
                          cardElevation[index] = activeElevation;
                        }
                      });
                    },
                    child: Card(
                      shadowColor: colors[index],
                      elevation: cardElevation[index],
                      child: Column(
                        children: [
                          Image.asset(
                            "images/counter.jpg",
                            width: 100,
                            height: 140,
                          ),
                          Text(counters[index]),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
      const Padding(
        padding: EdgeInsets.fromLTRB(8, 10, 8, 8),
        child: Text(
            "Передача новых показаний", /////// как варииант поместить в Card
            style: TextStyle(
              fontSize: 20,
            )),
      ),
      const ListTile(
        leading: Icon(Icons.warning, color: Color.fromARGB(255, 219, 145, 8)),
        subtitle: Text(
          'Рекомендуем передавать показания приборов '
          'учета до 25 числа. Показания преданные после '
          '25 числа, не будут приняты к расчету в этом месяце.',
          softWrap: true,
        ),
        isThreeLine: true,
      ),
      Padding(
        padding: const EdgeInsets.only(top: 0, left: 20, right: 20, bottom: 5),
        child: TextFormField(
          onChanged: (String enteredData) {
            newIndication = enteredData;
          },
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(const Size(200, 40)),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          child: const Text("Передать показания"),
          onPressed: () {
            quickMath();
          },
        ),
      ),
      const Padding(
        padding: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 18),
        child: Text('или'),
      ),
      ElevatedButton(
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(const Size(200, 40)),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        child: const Text("Загрузить фото"),
        onPressed: () => showDialog<String>(
          context: context,
          barrierDismissible: true,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Данная функция находится в разработке.'),
            content: const Text(
                'Данная функция будет добавлена в следующей версии.'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'Ок'),
                child: const Text('Ок'),
              ),
            ],
          ),
        ),
      ),
    ]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter layout',
      home: Scaffold(
        body: ListView(
          children: [header, iconsAndText],
        ),
      ),
    );
  }
}
