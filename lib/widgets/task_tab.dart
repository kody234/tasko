import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tasko/provider/task_manager.dart';
import 'package:tasko/widgets/tab_todo_listview.dart';
import 'package:tasko/widgets/todo_listview.dart';

import '../model/task_model1.dart';

class TaskTab extends StatelessWidget {
  const TaskTab(
      {Key? key,
      required this.color,
      required this.text,
      required this.inde,
      required this.taskBox})
      : super(key: key);
  final Color color;
  final String text;
  final int inde;
  final Box<Task> taskBox;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 40),
        height: 250.h,
        width: 150.w,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 30.w,
              ),
              child: Text(
                text,
                style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w800,
                    color: Colors.white),
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 30.w,
              ),
              child: const Divider(
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            ValueListenableBuilder(
              builder: (context, Box<Task> box, _) {
                List<Task> tasks = box.values.toList();
                if (tasks[inde].todos!.isEmpty) {
                  return Container();
                }
                return TabTodoListView(
                  inde: inde,
                  task: tasks[inde],
                  tasks: tasks,
                );
              },
              valueListenable: taskBox.listenable(),
            ),
          ],
        ));
  }
}
