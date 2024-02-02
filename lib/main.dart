import 'package:flutter/material.dart';
import 'package:todo_app/constants.dart';
import 'package:todo_app/screen/about.dart';
import 'package:todo_app/screen/completed.dart';
import 'package:todo_app/screen/home.dart';
import 'package:todo_app/theme/theme_constants.dart';

void main() {
  getPaths();
  runApp(const Main());
}

bool isDark = false;
ThemeData activeTheme = lightTheme;

class Main extends StatefulWidget {
  const Main({Key? key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (_) => Home(toggleTheme: toggleTheme),
        '/checked': (_) => Checked(
              checkedList: [],
              // error: error,
            ),
        '/about': (_) => About(),
      },
      theme: activeTheme,
      darkTheme: darkTheme,
    );
  }

  void toggleTheme() {
    setState(() {
      isDark = !isDark;
      activeTheme = isDark ? darkTheme : lightTheme;
    });
  }
}
