import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TaskTab extends StatelessWidget {
  const TaskTab({Key? key, required this.color, required this.text})
      : super(key: key);
  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.h,
      width: 150.h,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: Text(text),
      ),
    );
  }
}
