import 'package:flutter/material.dart';
import 'package:overandover/main.dart';
import 'package:email_validator/email_validator.dart';

var userEmail;
String p =
    "[a-zA-Z0-9+.\_\%-+]{1,256}@[a-zA-Z0-9][a-zA-Z0-9-]{0,64}(.[a-zA-Z0-9][a-zA-Z0-9-]{0,25})+";

class RestorePasswordPage extends StatefulWidget {
  const RestorePasswordPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RestorePasswordState();
}

class _RestorePasswordState extends State<RestorePasswordPage> {
  final myController = TextEditingController();
  String _errorMessage = '';

  void validateEmail(String val) {
    if (val.isEmpty) {
      setState(() {
        _errorMessage = "Email не может быть пустым!";
      });
    } else if (!EmailValidator.validate(val, true)) {
      setState(() {
        _errorMessage = "Неверный адрес электронной почты!";
      });
    } else {
      setState(() {
        _errorMessage = "";
        userEmail = val;
      });
    }
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

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
                    MaterialPageRoute(builder: (context) => const MyApp()),
                  );
                },
                icon: const Icon(Icons.arrow_back)),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Восстановление пароля', style: TextStyle(fontSize: 20)),
        )
      ],
    );
    
    
    
    Widget inputSection = Column(
      children: <Widget>[
        // Align(
        //   alignment: Alignment.centerLeft,
        //   child: Padding(
        //     padding: const EdgeInsets.all(8.0),
        //     child: IconButton(
        //         onPressed: () {
        //           Navigator.push(
        //             context,
        //             MaterialPageRoute(builder: (context) => const MyApp()),
        //           );
        //         },
        //         icon: const Icon(Icons.arrow_back)),
        //   ),
        // ),
        Container(
            padding: const EdgeInsets.only(
                top: 180, left: 10, right: 10, bottom: 10),
            child: const Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Укажите ваш email для восстановления пароля", 
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,),
              ),
            )),
        Padding(
          padding:
              const EdgeInsets.only(top: 0, left: 20, right: 20, bottom: 10),
          child: TextFormField(
            controller: myController,
            decoration: const InputDecoration(hintText: 'Введите ваш email'),
            onChanged: (enteredData) {
              validateEmail(enteredData);
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 8, 10),
          child: Text(
            _errorMessage,
            style: const TextStyle(color: Colors.red),
          ),
        ),
      ],
    );

    Widget buttonSection = Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            child: const Text("Восстановить"),
            onPressed: () {
              if (userEmail == null) {
              } else {
                showDialog<String>(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('Восстановление пароля.'),
                    content: Text('На указанный элетронный адрес - '
                        '${myController.text} - придет письмо с '
                        'инструкцией для восстановления пароля.'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MyApp()));
                        },
                        child: const Text('Ок'),
                      ),
                    ],
                  ),
                );
              }
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
          children: [
            header,
            inputSection,
            buttonSection,
          ],
        ),
      ),
    );
  }
}
