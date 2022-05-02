import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:tasko/extra/extra.dart';
import 'package:tasko/widgets/custom_modal_sheet.dart';

import '../model/task_model1.dart';
import '../provider/task_manager.dart';

class AddTodoButton extends StatefulWidget {
  const AddTodoButton(
      {Key? key,
      required this.index,
      required this.date,
      required this.task,
      required this.taskBox,
      required this.tasks})
      : super(key: key);

  final int index;
  final String date;
  final Task task;
  final List<Task> tasks;
  final Box<Task> taskBox;

  @override
  State<AddTodoButton> createState() => _AddTodoButtonState();
}

class _AddTodoButtonState extends State<AddTodoButton> {
  Box<Task> taskBox = Hive.box('tasks');
  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    void function() {
      setState(() {
        Todo todo = Todo(title: textEditingController.text, date: widget.date);

        widget.task.addTodo(todo, widget);

        Navigator.pop(context);
      });
    }

    return InkWell(
      onTap: () {
        CustomModalSheet().showTodoModal(context, textEditingController,
            widget.index, widget.date, widget.task, widget.taskBox, function);
      },
      child: Container(
        height: 70.h,
        width: 60.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Extra().rgbColor(
              widget.task.containerColor.r,
              widget.task.containerColor.g,
              widget.task.containerColor.b,
              widget.task.containerColor.a),
        ),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
