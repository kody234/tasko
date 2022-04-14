import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:tasko/model/task_model.dart';
import 'package:tasko/provider/task_manager.dart';
import 'package:tasko/widgets/add_todo_button.dart';
import 'package:tasko/widgets/todo_listview.dart';

class TaskPage extends StatefulWidget {
  TaskPage({Key? key, required this.task, required this.index})
      : super(key: key);

  @override
  State<TaskPage> createState() => _TaskPageState();
  final Task task;
  final int index;
}

class _TaskPageState extends State<TaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F8FA),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.settings,
                    size: 35.h,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.close,
                      size: 35.h,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Row(
                children: [
                  CircularPercentIndicator(
                    radius: 13.r,
                    progressColor: widget.task.containerColor,
                    lineWidth: 3.0.w,
                    percent: 0.60,
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Text(
                    widget.task.taskName,
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 40.sp,
                      color: Color(0xFF303030),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 75.w),
              child: Text(
                '2 of 7 tasks',
                style: TextStyle(
                    color: const Color(0xFFAEAEAF),
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 75.w),
              child: Divider(
                color: const Color(0xFFAEAEAF),
                thickness: 1.h,
                height: 1.h,
              ),
            ),
            TodosListView(inde: widget.index),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AddTodoButton(index: widget.index),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
