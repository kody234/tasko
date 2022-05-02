import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tasko/extra/extra.dart';
import 'package:tasko/provider/task_manager.dart';

import '../model/task_model1.dart';

class BarChartDesign extends StatefulWidget {
  const BarChartDesign(
      {Key? key,
      required this.task,
      required this.taskBox,
      required this.tasks})
      : super(key: key);

  @override
  _BarChartDesignState createState() => _BarChartDesignState();
  final Task task;
  final List<Task> tasks;
  final Box<Task> taskBox;
}

class _BarChartDesignState extends State<BarChartDesign> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      builder: (context, Box<Task> box, _) {
        return SizedBox(
          height: 50.h,
          width: 200.w,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: widget.tasks[index].todos!.length.toDouble() * 10,
                      width: 7,
                      color: Extra().rgbColor(
                          widget.tasks[index].containerColor.r,
                          widget.tasks[index].containerColor.g,
                          widget.tasks[index].containerColor.b,
                          widget.tasks[index].containerColor.a),
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  width: 10.w,
                );
              },
              itemCount: widget.tasks.length),
        );
      },
      valueListenable: widget.taskBox.listenable(),
    );
  }
}
