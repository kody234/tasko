import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:tasko/provider/task_manager.dart';
import 'package:tasko/ui/task_page.dart';
import 'package:tasko/widgets/custom_modal_sheet.dart';
import 'package:tasko/widgets/task_tab.dart';
import 'package:tasko/widgets/task_tab_listview.dart';

import '../model/task_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color pickerColor = const Color(0xff443a49);
  Color currentColor = const Color(0xff443a49);
  TextEditingController textController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    textController.dispose();
    super.dispose();
  }

  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  void function() {
    setState(() => currentColor = pickerColor);
    Provider.of<TaskManager>(context, listen: false).addNewTask(
      Task(
        containerColor: pickerColor,
        taskName: textController.text,
      ),
    );
    Navigator.pop(context);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskManager>(builder: (context, taskManager, widget) {
      Widget taskOn() {
        if (taskManager.tasks.isEmpty) {
          return Container();
        }
        return const TaskTabListView();
      }

      return SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Icon(
                Icons.settings,
                size: 35.h,
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 80,
                  child: Divider(
                    color: const Color(0xFFAEAEAF),
                    thickness: 1.h,
                    height: 1.h,
                  ),
                ),
                RichText(
                  text: TextSpan(
                      text: 'Task',
                      style: TextStyle(
                          color: const Color(0xFF303030),
                          fontSize: 30.sp,
                          fontWeight: FontWeight.w900),
                      children: const [
                        TextSpan(
                          text: ' List',
                          style: TextStyle(
                              color: Color(0xFFAEAEAF),
                              fontWeight: FontWeight.w500),
                        )
                      ]),
                ),
                SizedBox(
                  width: 80.w,
                  child: Divider(
                    color: const Color(0xFFAEAEAF),
                    thickness: 1.h,
                    height: 1.h,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40.h,
            ),
            Center(
              child: Column(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    child: IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        CustomModalSheet().showCustomModal(context, changeColor,
                            function, pickerColor, textController);
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (_) => TaskDetail(),
                        //   ),
                        // );
                      },
                    ),
                    decoration: BoxDecoration(
                        color: const Color(0xffF8F8FA),
                        borderRadius: BorderRadius.circular(10.r),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade500,
                              offset: const Offset(4, 4),
                              blurRadius: 10,
                              spreadRadius: 1)
                        ]),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  const Text('Add List'),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Consumer<TaskManager>(builder: (context, taskManager, widget) {
              if (taskManager.tasks.isEmpty) {
                return Container();
              }
              return Padding(
                padding: EdgeInsets.only(left: 50.w),
                child: const TaskTabListView(),
              );
            }),
          ],
        ),
      );
    });
  }
}
