import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tasko/provider/task_manager.dart';
import 'package:tasko/widgets/todo_tile.dart';

import '../model/task_model1.dart';

class TodosListView extends StatelessWidget {
  const TodosListView({Key? key, required this.inde, required this.taskBox})
      : super(key: key);

  final int inde;
  final Box<Task> taskBox;
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      builder: (context, Box<Task> box, _) {
        List<Task> tasks = box.values.toList();

        return Expanded(
          child: ListView.separated(
              itemBuilder: (context, index) {
                return TodoTile(
                  taskIndex: inde,
                  todoIndex: index,
                  tasks: tasks,
                  task: tasks[inde],
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 20.h,
                );
              },
              itemCount: tasks[inde].todos!.length),
        );
      },
      valueListenable: taskBox.listenable(),
    );
  }
}
