import 'dart:async';

import 'package:flutter/material.dart';

import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late ThemeData _selectedTheme;
  late Timer _timer;

  final ThemeData _lightTheme = ThemeData(
    primarySwatch: Colors.green,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.light,
  );

  final ThemeData _darkTheme = ThemeData(
    primarySwatch: Colors.brown,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.dark,
  );

  @override
  void initState() {
    _selectTheme();
    super.initState();
  }

  _selectTheme() {
    DateTime now = DateTime.now();
    DateTime darkThemeStartTime = DateTime(now.year, now.month, now.day, 17);
    DateTime darkThemeEndTime = DateTime(now.year, now.month, now.day, 6);
    int timerSeconds;

    if (now.compareTo(darkThemeEndTime) > 0 &&
        now.compareTo(darkThemeStartTime) < 0) {
      // print('lightTheme');
      _selectedTheme = _lightTheme;

      timerSeconds = darkThemeStartTime.difference(now).inSeconds;
    } else if (now.compareTo(darkThemeStartTime) > 0) {
      // print('darkTheme');
      _selectedTheme = _darkTheme;
      DateTime nextDayMorningTime =
          darkThemeStartTime.add(const Duration(days: 1));
      timerSeconds = nextDayMorningTime.difference(now).inSeconds;
    } else {
      // print('darkTheme');
      _selectedTheme = _darkTheme;
      timerSeconds = darkThemeEndTime.difference(now).inSeconds;
    }

    _timer = Timer(
      Duration(seconds: timerSeconds),
      () {
        _selectTheme();
        setState(() {});
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: _selectedTheme,
      home: const HomePage(),
    );
  }
}
