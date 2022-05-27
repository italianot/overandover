import 'package:flutter/material.dart';
import 'package:overandover/rest_api.dart';


class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HistoryState();
}

class _HistoryState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter layout',
        home: Scaffold(
            body: Column(children: <Widget>[
          Row(children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/homePage');
                    },
                    icon: const Icon(Icons.arrow_back)),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('История показаний', style: TextStyle(fontSize: 20)),
            ),
          ]),
          Expanded(
            child: ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: <Widget>[
                Column(
                  children: ai.map<Widget>((data) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: const Icon(Icons.light,
                            color: Color.fromARGB(255, 219, 145, 8)),
                        title: Text(
                            "${data["date"].toString()} от пользователя: ${data["client_id"].toString()}"),
                        subtitle: Container(
                          margin: const EdgeInsets.only(top: 5),
                          child: Table(
                            border: const TableBorder(
                                verticalInside: BorderSide(
                                    width: 1,
                                    color: Colors.blue,
                                    style: BorderStyle.solid)),
                            children: [
                              TableRow(children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(data["title"].toString(),
                                      textAlign: TextAlign.left),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 10, top: 5),
                                  child: Text(
                                      "Показания: ${data["indication"].toString()}",
                                      textAlign: TextAlign.left,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ),
                              ]),
                              TableRow(children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                      'Способ: ${data["send_type"].toString()}',
                                      textAlign: TextAlign.left),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 10, top: 5),
                                  child: Text(
                                      'Расход: ${data["delta"].toString()}',
                                      textAlign: TextAlign.left,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ),
                              ]),
                            ],
                          ),
                        ),
                        isThreeLine: true,
                        dense: false,
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ])));
  }
}

/*class _ReloadButton extends StatelessWidget {
  const _ReloadButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: (() =>
            HistoryModelProvider.read(context)?.model.reloadPosts()),
        child: const Text("Обновить данные"));
  }
}*/

/*class _CreateButton extends StatelessWidget {
  const _CreateButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: (() =>
            HistoryModelProvider.watch(context)?.model.createPosts()),
        child: const Text("Передать показания"));
  }
}*/

/*class _PostWidget extends StatelessWidget {
  const _PostWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: HistoryModelProvider.watch(context)?.model.posts.length ?? 0,
      itemBuilder: (BuildContext context, int index) {
        return _PostRowWidget(index: index);
      },
    );
  }
}*/

/*class _PostRowWidget extends StatelessWidget {
  //var isLoaded = false;
  final int index;
  const _PostRowWidget({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final post = HistoryModelProvider.watch(context)!.model.posts[index];

    // return Visibility(
    //   visible: isLoaded,
    //   child: ListView.builder(
    //     scrollDirection: Axis.vertical,
    //     shrinkWrap: true,
    //     itemCount: _items.length,
    //     itemBuilder: (context, index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[


        ListTile(
          leading:
              const Icon(Icons.light, color: Color.fromARGB(255, 219, 145, 8)),
          title: Text('1' /*post.id.toString()*/ /*posts![index].date*/),
          subtitle: Container(
            margin: const EdgeInsets.only(top: 5),
            child: Table(
              children: [
                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text('2' /*post.title*/ /* posts![index].title*/,
                        textAlign: TextAlign.left),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 5),
                    child: Text(
                        '3' /*post.title*/ /*"Показания: ${posts![index].indication}"*/,
                        textAlign: TextAlign.left,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ]),
                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                        '4' /*post.title*/ /*'Способ: ${posts![index].sendType}'*/,
                        textAlign: TextAlign.left),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10, top: 5),
                    child: Text(
                        '323' /*"Расход: ${posts![index].indication - posts![index - 1].indication}}"*/,
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
    //    },
    //   ),
    //   replacement: const Center(
    //     child: CircularProgressIndicator(),
    //   ),
    // );
  }
}*/
