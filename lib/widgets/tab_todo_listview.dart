import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tasko/model/task_model1.dart';

import '../provider/task_manager.dart';

class TabTodoListView extends StatelessWidget {
  final int inde;
  final Task task;
  final List<Task> tasks;
  const TabTodoListView(
      {Key? key, required this.inde, required this.task, required this.tasks})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          itemBuilder: (context, index) {
            return CheckboxListTile(
              enableFeedback: false,
              contentPadding: EdgeInsets.only(left: 20.w),
              side: const BorderSide(
                color: Colors.white,
              ),
              value: false,
              onChanged: (bool? value) {},
              controlAffinity: ListTileControlAffinity.leading,
              title: Text(
                tasks[inde].todos![index].title,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.white),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              height: 10.h,
            );
          },
          itemCount: tasks[inde].todos!.length),
    );
  }
}
