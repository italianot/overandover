import 'package:flutter/material.dart';
import 'package:overandover/post.dart';
import 'homePage.dart';
import 'rest_api.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HistoryState();
}

class _HistoryState extends State<HistoryPage> {
  List<Post>? posts;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    posts = await RemoteService().getPosts();
    if (posts != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout',
      home: Scaffold(
        body: Column(
          children: <Widget>[
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
                  child:
                      Text('История показаний', style: TextStyle(fontSize: 20)),
                ),
              ],
            ),
            Visibility(
              visible: isLoaded,
              child: ListView.builder(
                itemCount: posts?.length,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ListTile(
                        leading: const Icon(Icons.light,
                            color: Color.fromARGB(255, 219, 145, 8)),
                        title: Text(posts![index].date),
                        subtitle: Container(
                          margin: const EdgeInsets.only(top: 5),
                          child: Table(
                            children: [
                              TableRow(children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(posts![index].title,
                                      textAlign: TextAlign.left),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 10, top: 5),
                                  child: Text(
                                      "Показания: ${posts![index].indication}",
                                      textAlign: TextAlign.left,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ),
                              ]),
                              TableRow(children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                      'Способ: ${posts![index].sendType}',
                                      textAlign: TextAlign.left),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 10, top: 5),
                                  child: Text(
                                      "Расход: ${posts![index].indication - posts![index - 1].indication}}",
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
                    ],
                  );
                },
              ),
              replacement: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
