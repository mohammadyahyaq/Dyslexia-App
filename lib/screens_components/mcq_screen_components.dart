import 'package:dyslexia_app/backend/Question.dart';
import 'package:flutter/material.dart';

class Choice extends StatelessWidget {

  final String choiceText;
  final Color choiceColor;
  Choice({this.choiceText, this.choiceColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: choiceColor,
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 30.0),
          child: Text(
            choiceText,
            style: TextStyle(
              fontSize: 30.0
            ),
          ),
        ),
      ),
    );
  }
}
