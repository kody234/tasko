import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:tasko/extra/extra.dart';
import 'package:tasko/provider/task_manager.dart';

import '../model/task_model1.dart';

class TodoTile extends StatefulWidget {
  const TodoTile(
      {Key? key,
      required this.taskIndex,
      required this.todoIndex,
      required this.tasks,
      required this.task})
      : super(key: key);

  @override
  State<TodoTile> createState() => _TodoTileState();
  final int taskIndex;
  final int todoIndex;
  final List<Task> tasks;
  final Task task;
}

class _TodoTileState extends State<TodoTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10.w),
      child: CheckboxListTile(
        checkColor: Colors.white,
        activeColor: Extra().rgbColor(
            widget.tasks[widget.taskIndex].containerColor.r,
            widget.tasks[widget.taskIndex].containerColor.g,
            widget.tasks[widget.taskIndex].containerColor.b,
            widget.tasks[widget.taskIndex].containerColor.a),
        secondary: IconButton(
          onPressed: () {
            setState(() {});

            widget.task.doneTasks!.remove(widget.task.todos![widget.todoIndex]);

            widget.task.deleteTodo(widget.todoIndex, widget);

            Box<Task> taskBox = Hive.box('tasks');

            taskBox
                .putAt(widget.taskIndex, widget.task)
                .then((value) => print(taskBox.values.first.todos!.length));
          },
          icon: Icon(Icons.delete),
        ),
        enableFeedback: true,
        side: const BorderSide(
          color: Color(0xFFAEAEAF),
        ),
        controlAffinity: ListTileControlAffinity.leading,
        title: Text(
          widget.tasks[widget.taskIndex].todos![widget.todoIndex].title,
          style: TextStyle(
            decoration:
                widget.tasks[widget.taskIndex].todos![widget.todoIndex].isDone
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
            fontWeight: FontWeight.w900,
            fontSize: 17.sp,
            color:
                widget.tasks[widget.taskIndex].todos![widget.todoIndex].isDone
                    ? Colors.red
                    : Theme.of(context).primaryColor,
          ),
        ),
        subtitle: Text(
          widget.tasks[widget.taskIndex].todos![widget.todoIndex].date,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 10.sp,
            decoration:
                widget.tasks[widget.taskIndex].todos![widget.todoIndex].isDone
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
            color:
                widget.tasks[widget.taskIndex].todos![widget.todoIndex].isDone
                    ? Colors.red
                    : Theme.of(context).primaryColor,
          ),
        ),
        onChanged: (bool? value) {
          if (widget.tasks[widget.taskIndex].todos![widget.todoIndex].isDone ==
              false) {
            Todo todo = widget.task.todos![widget.todoIndex];
            widget.task.taskDone(todo, widget);
          } else if (widget
                  .tasks[widget.taskIndex].todos![widget.todoIndex].isDone ==
              true) {
            Box<Task> taskBox = Hive.box('tasks');

            widget.task.doneTasks!.remove(widget.task.todos![widget.todoIndex]);
            taskBox
                .putAt(widget.taskIndex, widget.task)
                .then((value) => print(taskBox.values.first.todos!.length));
          }
          setState(() {});
          widget.tasks[widget.taskIndex].todos![widget.todoIndex].isDone =
              value!;
        },
        value: widget.tasks[widget.taskIndex].todos![widget.todoIndex].isDone,
      ),
    );
  }
}
