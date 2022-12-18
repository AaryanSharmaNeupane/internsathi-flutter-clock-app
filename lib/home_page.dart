import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String greeting;
  @override
  void initState() {
    greets();
    super.initState();
  }

  void greets() {
    var hour = DateTime.now().hour;

    // print(hour);

    if (hour > 0 && hour < 12) {
      greeting = 'Morning';
    } else if (hour >= 12 && hour < 17) {
      greeting = 'Afternoon';
    } else {
      greeting = 'Evening';
    }
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('kk:mm:ss').format(now);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Clock App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Good $greeting"),
            Text("Current time is $formattedDate"),
          ],
        ),
      ),
    );
  }
}
