import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:tasko/model/task_model1.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  Box<LightTheme> themeBox = Hive.box('theme');
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Colors
            .transparent, // set the Color of the drawer transparent; we'll paint above it with the shape
      ),
      child: Drawer(
        child: Container(
          height: double.infinity.h,
          margin: EdgeInsets.only(right: 120.w, bottom: 100.h, top: 100.h),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            color: Colors.grey[200],
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Switch(
                  activeColor: Colors.black,
                  onChanged: (bool value) {
                    Navigator.pop(context);
                    setState(() {});
                    themeBox.values.first.light = value;
                    themeBox.putAt(0, LightTheme(light: value));
                  },
                  value: themeBox.values.first.light,
                ),
                Text(
                  'dark theme',
                  style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                )
              ],
            ),
          ),
        ),
        elevation: 0,
      ),
    );
  }
}
