import 'package:flutter/material.dart';

import 'task_list.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  TimeOfDay now = TimeOfDay.now();

  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Hi,\nGood Morning';
    }
    if (hour < 17) {
      return 'Hi,\nGood Afternoon';
    }
    return 'Hi,\nGood Evening';
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.teal,
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomeView()));
          },
          label: Text('Check Todo List')),
      body: Center(
          child: Text(
        greeting(),
        style: TextStyle(fontSize: size.height / 10),
      )),
    );
  }
}
