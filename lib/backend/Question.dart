import 'package:dyslexia_app/screens_components/mcq_screen_components.dart';
import 'package:flutter/material.dart';

class Question {
  String question;
  List<String> choices;
  int answer;

  Question({this.question, this.choices, this.answer});

  bool isCorrect(int answer) {
    return this.answer == answer;
  }

  List<Widget> generateWidgets() {
    List<Widget> questionWidgets = [
      Padding(
        padding: EdgeInsets.only(bottom: 20.0),
        child: Text(
          this.question,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 40.0,
            color: Colors.black,
          ),
        ),
      ),
    ];

    for (int i = 0; i < choices.length; i++) {
      questionWidgets.add(
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
          child: Choice(choiceText: choices[i]),
        ),
      );
    }
    return questionWidgets;
  }
}
