import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/task_model1.dart';
import '../provider/task_manager.dart';

class CustomModalSheet {
  // create some values

// ValueChanged<Color> callback

  void _showMaterialDialog(BuildContext context, Function(Color) changeColor,
      void Function()? function, Color pickerColor) {
    showDialog(
        context: context,
        builder: (context) {
          return SizedBox(
            height: 400,
            width: 400,
            child: AlertDialog(
              title: const Text('Material Dialog'),
              content: SingleChildScrollView(
                child: BlockPicker(
                  useInShowDialog: true,
                  pickerColor: pickerColor,
                  onColorChanged: changeColor,
                ),
              ),
              actions: <Widget>[
                ElevatedButton(
                    child: const Text('Got it'), onPressed: function),
              ],
            ),
          );
        });
  }

  void showCustomModal(
      BuildContext context,
      Function(Color) changeColor,
      void Function()? function,
      Color pickerColor,
      TextEditingController textController) {
    showMaterialModalBottomSheet(
        context: context,
        builder: (context) => SizedBox(
              height: 250.h,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                child: Column(
                  children: [
                    Center(
                      child: Text('Name your Task',
                          style: Theme.of(context).textTheme.headline4),
                    ),
                    TextFormField(
                      controller: textController,
                    ),
                    TextButton(
                      onPressed: () {
                        _showMaterialDialog(
                            context, changeColor, function, pickerColor);
                      },
                      child: Container(
                        height: 40.h,
                        width: 80.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: const Color(0xFF303030),
                        ),
                        child: Center(
                          child: Text('Create task',
                              style: Theme.of(context).textTheme.headline5),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ));
  }

  void showTodoModal(
      BuildContext context,
      TextEditingController textController,
      int index,
      String date,
      Task task,
      Box taskBox,
      void Function()? function) {
    showMaterialModalBottomSheet(
        context: context,
        builder: (context) => SizedBox(
              height: 250.h,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        'Name your Todo',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ),
                    TextFormField(
                      controller: textController,
                    ),
                    TextButton(
                      onPressed: function,
                      child: Container(
                        height: 40.h,
                        width: 80.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: const Color(0xFF303030),
                        ),
                        child: Center(
                          child: Text(
                            'Create todo',
                            style: Theme.of(context).textTheme.headline5,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ));
  }
}
