import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:tasko/extra/extra.dart';
import 'package:tasko/provider/task_manager.dart';

import '../model/task_model1.dart';
import '../ui/task_page.dart';

class CustomPercentIndicator extends StatelessWidget {
  const CustomPercentIndicator({
    Key? key,
    required this.context,
    required this.index,
    required this.taskBox,
    required this.task,
  }) : super(key: key);
  final Box<Task> taskBox;
  final Task task;
  final BuildContext context;
  final int index;

  double todoPercent() {
    try {
      double value = task.doneTasks!.length / task.todos!.length;
      print(value);
      return value;
    } catch (e) {
      print(e);
    }
    return 0.9;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: taskBox.listenable(),
      builder: (context, taskManager, _) => CircularPercentIndicator(
        radius: 13.r,
        progressColor: Extra().rgbColor(
            task.containerColor.r,
            task.containerColor.g,
            task.containerColor.b,
            task.containerColor.a),
        lineWidth: 3.0.w,
        percent: todoPercent(),
      ),
    );
  }
}
