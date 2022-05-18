// import 'package:flutter/cupertino.dart';

import 'package:flutter/cupertino.dart';
import 'package:overandover/post.dart';

class HistoryWidgetModel extends ChangeNotifier {
  final _posts = <Post>[];
  List<Post> get posts => _posts;

  void reloadPosts() {}
  void createPosts() {}
}

class HistoryModelProvider extends InheritedNotifier {
  final HistoryModelProvider model;
  const HistoryModelProvider({
    Key? key,
    required this.model,
    required Widget child,
  }) : super(key: key, child: child);

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
