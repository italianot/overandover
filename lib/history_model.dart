import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:overandover/post.dart';
import 'package:overandover/rest_api.dart';

class HistoryWidgetModel extends ChangeNotifier {
  var apiHistory = ApiHistory();
  var _posts = const <Post>[];
  List<Post> get posts => _posts;

  Future<void> reloadHistory() async {
    final posts = await apiHistory.getHistory();
    _posts += posts;
    notifyListeners();
  }

  void createPost() async {}
}

class HistoryModelProvider extends InheritedNotifier {
  final HistoryWidgetModel model;
  const HistoryModelProvider({
    Key? key,
    required this.model,
    required Widget child,
  }) : super(
          key: key,
          notifier: model,
          child: child,
        );

  static HistoryModelProvider? watch(BuildContext context) {
    //возврат и подписывается
    return context.dependOnInheritedWidgetOfExactType<HistoryModelProvider>();
  }

  static HistoryModelProvider? read(BuildContext context) {
    //простой возврат
    final widget = context
        .getElementForInheritedWidgetOfExactType<HistoryModelProvider>()
        ?.widget;
    return widget is HistoryModelProvider ? widget : null;
  }
}
