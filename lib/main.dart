import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:tasko/app_theme.dart';
import 'package:tasko/model/task_model1.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tasko/provider/state_manager.dart';
import 'package:tasko/provider/task_manager.dart';
import 'package:tasko/ui/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory directory = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(directory.path);
  Hive.registerAdapter(TaskAdapter());
  Hive.registerAdapter(TodoAdapter());
  Hive.registerAdapter(ContainerColorAdapter());
  Hive.registerAdapter(LightThemeAdapter());
  await Hive.openBox<Task>('tasks');
  await Hive.openBox<LightTheme>('theme');

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int initialPage = 0;
  late Box<LightTheme> themeBox;

  List pages = [
    const HomePage(),
    Container(color: Colors.purple),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    themeBox = Hive.box('theme');

    if (themeBox.isEmpty) {
      themeBox.add(LightTheme());
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ThemeMode themeManager() {
      if (themeBox.values.first.light == true) {
        return ThemeMode.dark;
      }
      return ThemeMode.light;
    }

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => StateManager()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 640),
        builder: () => ValueListenableBuilder(
            valueListenable: themeBox.listenable(),
            builder: (context, Box<LightTheme> box, _) {
              return MaterialApp(
                theme: AppTheme().light(),
                darkTheme: AppTheme().dark(),
                themeMode: themeManager(),
                home: Scaffold(
                  backgroundColor: const Color(0xffF8F8FA),
                  body: HomePage(),
                ),
              );
            }),
      ),
    );
  }
}
