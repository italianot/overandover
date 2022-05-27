import 'package:flutter/material.dart';
import 'rest_api.dart';

var newIndication;

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final post = ModalRoute.of(context)!.settings.arguments as Post;
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
        dense: true,
      ),
      Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding:
              const EdgeInsets.only(top: 8, left: 20, right: 20, bottom: 8),
          child: SizedBox(
            width: 150,
            height: 170,
            child: Card(
              elevation: 10,
              child: Column(
                children: [
                  Image.asset(
                    "images/counter.jpg",
                    width: 100,
                    height: 140,
                  ),
                  const Text('Счетчик CE303 R33')
                ],
              ),
            ),
          ),
        ),
      ),
      const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text("Передача новых показаний",
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
      const Padding(
        padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 0),
        child: Text('или'),
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
    ]);

    return MaterialApp(
      title: 'Flutter layout',
      home: Scaffold(
        body: ListView(
          children: [header, iconsAndText],
        ),
      ),
    );
  }
}

/*class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  List _items = [];

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/json/history.json');
    final data = await json.decode(response);
    setState(() {
      _items = data["data"];
    });
  }
}*/
