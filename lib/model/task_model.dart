import 'dart:ui';

class Task {
  final String taskName;
  final Color containerColor;

  Task({
    required this.containerColor,
    required this.taskName,
  });

  List<Todo> todos = [];
}

class Todo {
  final String title;
  late final bool isDone;

  Todo({this.isDone = false, required this.title});
}
