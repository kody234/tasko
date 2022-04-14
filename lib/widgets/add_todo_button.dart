import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tasko/widgets/custom_modal_sheet.dart';

import '../provider/task_manager.dart';

class AddTodoButton extends StatelessWidget {
  const AddTodoButton({Key? key, required this.index}) : super(key: key);

  final int index;
  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();

    return InkWell(
      onTap: () {
        CustomModalSheet().showTodoModal(context, textEditingController, index);
      },
      child: Container(
        height: 70.h,
        width: 60.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Provider.of<TaskManager>(context, listen: false)
                .tasks[index]
                .containerColor),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
