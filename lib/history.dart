//import 'dart:convert';
//import 'dart:io';
//import 'package:flutter/services.dart';
////import 'package:overandover/post.dart';
//import 'rest_api.dart';

import 'package:flutter/material.dart';
import 'package:overandover/history_model.dart';
import 'homePage.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HistoryState();
}

class _HistoryState extends State<HistoryPage> {
  final model = HistoryWidgetModel();//////////////////////

  //List<Post>? posts;
  List _items = [];

  /*Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/json/history.json');
    final data = await json.decode(response);
    setState(() {
      _items = data["data"];
    });
  }*/

  // void main() {
  // final file = File('json/history.json');
  // final string = file.readAsStringSync();
  // final data = json.decode(string);
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   getData();
  // }

  // getData() async {
  //   posts = await RemoteService().getPosts();
  //   if (posts != null) {
  //     setState(() {
  //       isLoaded = true;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout',
      home: Scaffold(
          body:  HistoryModelProvider(
            model: model,
            child: 
              Column(children: <Widget>[
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: _ReloadButton(),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: _CreateButton(),
        ),
        Row(
          children: [
            Align(
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
                    icon: const Icon(Icons.arrow_back)),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('История показаний', style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
        const _PostWidget(),
      ])),
    ),
    );
  }
}

class _ReloadButton extends StatelessWidget {
  const _ReloadButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: (() =>
            HistoryModelProvider.read(context)?.model.reloadPosts()),
        child: const Text("Обновить данные"));
  }
}

class _CreateButton extends StatelessWidget {
  const _CreateButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: (() =>
            HistoryModelProvider.watch(context)?.model.createPosts()),
        child: const Text("Передать показания"));
  }
}

class _PostWidget extends StatelessWidget {
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
}

class _PostRowWidget extends StatelessWidget {
  //var isLoaded = false;
  final int index;
  const _PostRowWidget({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final post = HistoryModelProvider.watch(context)!.model.posts[index];

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
}
