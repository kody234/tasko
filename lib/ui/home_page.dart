import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tasko/widgets/custom_modal_sheet.dart';
import 'package:tasko/widgets/drawer.dart';
import 'package:tasko/widgets/task_tab_listview.dart';

import '../model/task_model1.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> scaffolKey = GlobalKey<ScaffoldState>();
  late Box<Task> taskBox;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    taskBox = Hive.box('tasks');
  }

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

    Task task = Task(
        todos: [],
        name: textController.text,
        containerColor: ContainerColor(
            r: pickerColor.red,
            g: pickerColor.green,
            b: pickerColor.blue,
            a: pickerColor.alpha),
        doneTasks: []);
    taskBox.add(task);
    Navigator.pop(context);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEnableOpenDragGesture: false,
      drawer: const CustomDrawer(),
      key: scaffolKey,
      body: ValueListenableBuilder(
          valueListenable: taskBox.listenable(),
          builder: (context, Box<Task> box, _) {
            List<Task> tasks = box.values.toList();

            Widget taskOn() {
              if (tasks.isEmpty) {
                return Container();
              }
              return TaskTabListView(
                taskBox: taskBox,
              );
            }

            return SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: IconButton(
                      icon: Icon(
                        Icons.settings,
                        size: 35.h,
                      ),
                      onPressed: () {
                        scaffolKey.currentState!.openDrawer();
                      },
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 80.w,
                        child: Divider(
                          color: const Color(0xFFAEAEAF),
                          thickness: 1.h,
                          height: 1.h,
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'Task',
                          style: Theme.of(context).textTheme.headline1,
                          children: [
                            TextSpan(
                              text: '-O',
                              style: Theme.of(context).textTheme.headline2,
                            ),
                          ],
                        ),
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
                            icon: Icon(
                              Icons.add,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              CustomModalSheet().showCustomModal(
                                  context,
                                  changeColor,
                                  function,
                                  pickerColor,
                                  textController);
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
                        Text(
                          'Add Task',
                          style: Theme.of(context).textTheme.headline3,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  ValueListenableBuilder(
                    builder: (context, Box<Task> box, _) {
                      List<Task> tasks = box.values.toList();
                      if (tasks.isEmpty) {
                        return Container();
                      }
                      return Padding(
                        padding: EdgeInsets.only(left: 50.w),
                        child: TaskTabListView(
                          taskBox: taskBox,
                        ),
                      );
                    },
                    valueListenable: taskBox.listenable(),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
