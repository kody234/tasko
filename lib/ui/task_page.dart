import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

import 'package:tasko/provider/task_manager.dart';
import 'package:tasko/widgets/add_todo_button.dart';
import 'package:tasko/widgets/bar_chart_design.dart';
import 'package:tasko/widgets/todo_listview.dart';

import '../model/task_model1.dart';
import '../widgets/custom_percent_indicator.dart';

class TaskPage extends StatefulWidget {
  const TaskPage(
      {Key? key,
      required this.task,
      required this.index,
      required this.taskBox,
      required this.tasks})
      : super(key: key);

  @override
  State<TaskPage> createState() => _TaskPageState();
  final Task task;
  final int index;
  final List<Task> tasks;
  final Box<Task> taskBox;
}

class _TaskPageState extends State<TaskPage> {
  String formattedDate = DateFormat('EEE d MMM').format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(bottom: 40.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
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
                    CustomPercentIndicator(
                      index: widget.index,
                      context: context,
                      task: widget.task,
                      taskBox: widget.taskBox,
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Text(widget.task.name,
                        style: Theme.of(context).textTheme.headline6),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              TodoCounter(
                index: widget.index,
                taskBox: widget.taskBox,
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
              TodosListView(
                inde: widget.index,
                taskBox: widget.taskBox,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BarChartDesign(
                      task: widget.task,
                      taskBox: widget.taskBox,
                      tasks: widget.tasks,
                    ),
                    AddTodoButton(
                      index: widget.index,
                      date: formattedDate,
                      taskBox: widget.taskBox,
                      task: widget.task,
                      tasks: widget.tasks,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TodoCounter extends StatelessWidget {
  final Box<Task> taskBox;
  TodoCounter({
    Key? key,
    required this.index,
    required this.taskBox,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      builder: (context, Box<Task> box, _) {
        List<Task> tasks = box.values.toList();

        return Padding(
          padding: EdgeInsets.only(left: 75.w),
          child: Text(
              '${tasks[index].doneTasks!.length} of ${tasks[index].todos!.length} tasks done',
              style: Theme.of(context).textTheme.bodyText1),
        );
      },
      valueListenable: taskBox.listenable(),
    );
  }
}
