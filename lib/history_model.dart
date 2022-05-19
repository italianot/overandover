// import 'package:flutter/cupertino.dart';

import 'package:flutter/cupertino.dart';
import 'package:overandover/post.dart';
import 'package:overandover/rest_api.dart';

class HistoryWidgetModel extends ChangeNotifier {
  final apiHistory = ApiHistory();
  var _posts = <Post>[];
  List<Post> get posts => _posts;

  Future<void> reloadPosts() async {
    final posts = await apiHistory.getHistory();
    _posts += posts;
    notifyListeners();
    print(posts);
  }

  Future<void> createPosts() async {
    final posts = await apiHistory.createPost(title: "fsfsff", body: "wfwg33");
  }
}

///////////// где то здесь
class HistoryModelProvider extends InheritedNotifier {
  final HistoryWidgetModel model;
  const HistoryModelProvider({
    Key? key,
    required this.model,
    required Widget child,
  }) : super(key: key, notifier: model, child: child);

  static HistoryModelProvider? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<HistoryModelProvider>();
  }

  static HistoryModelProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<HistoryModelProvider>()
        ?.widget;
    return widget is HistoryModelProvider ? widget : null;
  }
}
