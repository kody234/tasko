import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tasko/provider/task_manager.dart';
import 'package:tasko/ui/task_page.dart';
import 'package:tasko/widgets/task_tab.dart';

class TaskTabListView extends StatefulWidget {
  const TaskTabListView({Key? key}) : super(key: key);

  @override
  State<TaskTabListView> createState() => _TaskTabListViewState();
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
      child: Consumer<TaskManager>(
        builder: (context, taskManager, widget) => ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final provider = Provider.of<TaskManager>(context, listen: false);
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => TaskPage(
                        index: index,
                        task: provider.tasks[index],
                      ),
                    ),
                  );
                },
                child: TaskTab(
                  color: provider.tasks[index].containerColor,
                  text: provider.tasks[index].taskName,
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                width: 20.w,
              );
            },
            itemCount:
                Provider.of<TaskManager>(context, listen: false).tasks.length),
      ),
    );
  }
}
