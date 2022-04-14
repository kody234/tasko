import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tasko/provider/task_manager.dart';

class TodoTile extends StatefulWidget {
  const TodoTile({Key? key, required this.taskIndex, required this.todoIndex})
      : super(key: key);

  final int taskIndex;
  final int todoIndex;

  @override
  State<TodoTile> createState() => _TodoTileState();
}

class _TodoTileState extends State<TodoTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 10.w),
        child: CheckboxListTile(
          enableFeedback: true,
          side: const BorderSide(
            color: Color(0xFFAEAEAF),
          ),
          controlAffinity: ListTileControlAffinity.leading,
          title: Text(
            Provider.of<TaskManager>(context, listen: false)
                .tasks[widget.taskIndex]
                .todos[widget.todoIndex]
                .title,
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 17.sp,
              color: const Color(0xFF303030),
            ),
          ),
          subtitle: Text('time'),
          onChanged: (bool? value) {
            setState(() {
              Provider.of<TaskManager>(context, listen: false)
                  .tasks[widget.taskIndex]
                  .todos[widget.todoIndex]
                  .isDone = value!;
            });
          },
          value: Provider.of<TaskManager>(context, listen: false)
              .tasks[widget.taskIndex]
              .todos[widget.todoIndex]
              .isDone,
        ));
  }
}
