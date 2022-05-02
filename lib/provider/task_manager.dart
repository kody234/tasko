// import 'package:flutter/cupertino.dart';
//
// import '../model/task_model.dart';
//
// class TaskManager extends ChangeNotifier {
//   List<Task> tasks = [];
//
//   void addNewTask(Task task) {
//     tasks.add(task);
//     notifyListeners();
//   }
//
//   void deleteTask(index) {
//     tasks.removeAt(index);
//     notifyListeners();
//   }
//
//   void updatetask(Task task, int index) {
//     tasks[index] = task;
//     notifyListeners();
//   }
//
//   void addtodo(int index, Todo todo) {
//     tasks[index].todos.add(todo);
//     notifyListeners();
//   }
//
//   void deletetodo(int taskIndex, int todoIndex) {
//     tasks[taskIndex].todos.removeAt(todoIndex);
//     notifyListeners();
//   }
//
//   void todosDone(int taskIndex, Todo todo) {
//     tasks[taskIndex].todosDone.add(todo);
//     notifyListeners();
//   }
//
//   void todosNotDone(int taskIndex, Todo todo) {
//     tasks[taskIndex].todosDone.remove(todo);
//     notifyListeners();
//   }
// }
