import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tasko/provider/state_manager.dart';
import 'package:tasko/provider/task_manager.dart';
import 'package:tasko/ui/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int initialPage = 0;

  List pages = [const HomePage(), Container(color: Colors.purple), Container()];

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TaskManager()),
        ChangeNotifierProvider(create: (_) => StateManager()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 640),
        builder: () => MaterialApp(
          home: Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: const Color(0xFF303030),
              unselectedItemColor: const Color(0xFFAEAEAF),
              currentIndex: initialPage,
              enableFeedback: true,
              onTap: (index) {
                setState(() {
                  initialPage = index;
                });
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: '',
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.calendar_today_rounded), label: ''),
                BottomNavigationBarItem(icon: Icon(Icons.menu_sharp), label: '')
              ],
            ),
            backgroundColor: const Color(0xffF8F8FA),
            body: pages[initialPage],
          ),
        ),
      ),
    );
  }
}
