import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'عسر القراءة',
      theme: ThemeData(
        fontFamily: "Tajawal",
        primaryColor: Color(0xFFFFFFFF),
        accentColor: Color(0xFFFFBF09),
        cardColor: Color(0xFFFFF8E8),
      ),
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
    return Text("تجربة النص");
  }
}
