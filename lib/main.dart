import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasko/ui/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int initialPage = 0;

  List pages = [const HomePage(), Container(color: Colors.purple), Container()];

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 640),
      builder: () => MaterialApp(
        home: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: initialPage,
            enableFeedback: true,
            onTap: (index) {
              setState(() {
                initialPage = index;
              });
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'menu'),
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'menu'),
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'menu')
            ],
          ),
          backgroundColor: const Color(0xffF8F8FA),
          body: pages[initialPage],
        ),
      ),
    );
  }
}
