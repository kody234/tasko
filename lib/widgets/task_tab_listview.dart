import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tasko/extra/extra.dart';
import 'package:tasko/provider/task_manager.dart';
import 'package:tasko/ui/task_page.dart';
import 'package:tasko/widgets/task_tab.dart';

import '../model/task_model1.dart';

class TaskTabListView extends StatefulWidget {
  const TaskTabListView({Key? key, required this.taskBox}) : super(key: key);

  @override
  State<TaskTabListView> createState() => _TaskTabListViewState();
  final Box<Task> taskBox;
}

class _TaskTabListViewState extends State<TaskTabListView> {
  @override
  Widget build(BuildContext context) {
    // create some values
    Color pickerColor = const Color(0xff443a49);
    Color currentColor = const Color(0xff443a49);

// ValueChanged<Color> callback
    void changeColor(Color color) {
      setState(() => pickerColor = color);
    }

    return SizedBox(
      height: 280.h,
      child: ValueListenableBuilder(
        builder: (context, Box<Task> box, _) {
          List<Task> tasks = box.values.toList();
          return ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onLongPress: () {
                    widget.taskBox.deleteAt(index);
                  },
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => TaskPage(
                          index: index,
                          task: tasks[index],
                          taskBox: widget.taskBox,
                          tasks: tasks,
                        ),
                      ),
                    );
                  },
                  child: TaskTab(
                    inde: index,
                    color: Extra().rgbColor(
                        tasks[index].containerColor.r,
                        tasks[index].containerColor.g,
                        tasks[index].containerColor.b,
                        tasks[index].containerColor.a),
                    text: tasks[index].name,
                    taskBox: widget.taskBox,
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  width: 20.w,
                );
              },
              itemCount: tasks.length);
        },
        valueListenable: widget.taskBox.listenable(),
      ),
    );
  }
}
