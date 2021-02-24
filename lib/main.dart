import 'package:flutter/material.dart';

// Abdulrahman, Mohammad, Serajaldeen, Suleiman.
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'عسر القراءة',
      home: Scaffold(
        body: SafeArea(
          child: AppHomeUI(),
        ),
      ),
    );
  }
}

class AppHomeUI extends StatefulWidget {
  @override
  _AppHomeUIState createState() => _AppHomeUIState();
}

class _AppHomeUIState extends State<AppHomeUI> {
  @override
  Widget build(BuildContext context) {
    return Text("Work In Progress");
  }
}
