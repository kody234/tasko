import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tasko/provider/task_manager.dart';
import 'package:tasko/widgets/todo_tile.dart';

class TodosListView extends StatelessWidget {
  const TodosListView({Key? key, required this.inde}) : super(key: key);

  final int inde;
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskManager>(builder: (context, taskManager, widget) {
      final provider = Provider.of<TaskManager>(context, listen: false);
      return SizedBox(
        height: 350,
        child: ListView.separated(
            itemBuilder: (context, index) {
              return TodoTile(
                taskIndex: inde,
                todoIndex: index,
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 20.h,
              );
            },
            itemCount: provider.tasks[inde].todos.length),
      );
    });
  }
}
