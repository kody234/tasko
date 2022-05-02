import 'dart:ui';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../widgets/add_todo_button.dart';
import '../widgets/todo_tile.dart';
part 'task_model1.g.dart';

@HiveType(typeId: 0)
class Task {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final List<Todo>? todos;
  @HiveField(3)
  final List<Todo>? doneTasks;
  @HiveField(4)
  final ContainerColor containerColor;

  Task(
      {required this.name,
      this.id,
      required this.doneTasks,
      required this.containerColor,
      required this.todos});

  void addTodo(Todo todo, AddTodoButton widget) {
    Box<Task> taskBox = Hive.box('tasks');
    todos!.add(todo);
    taskBox
        .putAt(widget.index, widget.task)
        .then((value) => print(taskBox.values.first.todos!.length));
  }

  void deleteTodo(int index, TodoTile widget) {
    Box<Task> taskBox = Hive.box('tasks');
    todos!.removeAt(index);
    taskBox
        .putAt(widget.taskIndex, widget.task)
        .then((value) => print(taskBox.values.first.todos!.length));
  }

  void taskDone(Todo todo, widget) {
    Box<Task> taskBox = Hive.box('tasks');
    doneTasks!.add(todo);
    taskBox
        .putAt(widget.taskIndex, widget.task)
        .then((value) => print(taskBox.values.first.todos!.length));
  }
}

@HiveType(typeId: 1)
class Todo {
  @HiveField(0)
  String title;
  @HiveField(1)
  bool isDone = false;
  @HiveField(2)
  final String date;
  Todo({required this.title, required this.date});
}

@HiveType(typeId: 2)
class ContainerColor {
  @HiveField(0)
  final int r;
  @HiveField(1)
  final int g;
  @HiveField(2)
  final int b;
  @HiveField(3)
  final int a;
  ContainerColor(
      {required this.r, required this.g, required this.b, required this.a});
}

@HiveType(typeId: 3)
class LightTheme {
  @HiveField(0)
  bool light;
  LightTheme({this.light = false});
}
