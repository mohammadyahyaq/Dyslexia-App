import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {

  static String winId = '/kid/exercises/winScreen';
  static String loseId = '/kid/exercises/loseScreen';

  ResultScreen({this.result});

  final Result result;

  @override
  Widget build(BuildContext context) {
    String resultMessage;
    Color resultColor;
    if(result == Result.win) {
      resultMessage = 'أحسنت لقد اجتزت هذا التمرين 🎉';
      resultColor = Color(0xFF5EB693);
    } else {
      resultMessage = 'مع الأسف، لم تجتز هذا الاختبار\nحاول مرة أخرى';
      resultColor = Color(0xFFFF5F3D);
    }
    return Scaffold(
      body: Center(
        child: Card(
          margin: EdgeInsets.symmetric(vertical: 250.0,horizontal: 15.0),
          child: Center(
            child: Text(
              resultMessage,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: resultColor,
                fontWeight: FontWeight.w600,
                fontSize: 30.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

enum Result {
  win,
  lose
}