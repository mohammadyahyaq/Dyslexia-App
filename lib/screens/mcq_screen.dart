import 'package:dyslexia_app/backend/Question.dart';
import 'package:dyslexia_app/screens_brain/mcq_brain.dart';
import 'package:flutter/material.dart';

class MCQScreen extends StatefulWidget {

  static final String completeStmId = '/mcq_screen/complete_stmt';
  static final String tanweenId = '/mcq_screen/tanween';

  final MCQBrain brain;

  MCQScreen({@required this.brain});

  @override
  _MCQScreenState createState() => _MCQScreenState();
}

class _MCQScreenState extends State<MCQScreen> {
  MCQBrain brain;
  Question currentQuestion;

  @override
  void initState() {
    brain = widget.brain;
    currentQuestion = brain.getNext();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFBF09),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: currentQuestion.generateWidgets(),
      ),
    );
  }
}
