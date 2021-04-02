import 'package:dyslexia_app/screens_brain/mcq_brain.dart';
import 'package:flutter/material.dart';

class MCQScreen extends StatefulWidget {
  static final String completeStmId = '/kid/mcq_screen/complete_stmt';
  static final String tanweenId = '/kid/mcq_screen/tanween';

  MCQBrain brain;

  MCQScreen({@required this.brain});

  @override
  _MCQScreenState createState() => _MCQScreenState();
}

class _MCQScreenState extends State<MCQScreen> with SingleTickerProviderStateMixin {
  MCQBrain brain;

  AnimationController answerController;

  @override
  void initState() {
    brain = widget.brain;
    answerController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    brain.setEssential(setState, answerController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    brain.context = context; // we have to pass the context object here to the UI brain, since it is required to move to the result screen
    return Scaffold(
      backgroundColor: Color(0xFFFFBF09),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: brain.questionWidgets,
            ),
          ),
          Row(
            children: brain.progressBarWidgets,
          ),
        ],
      ),
    );
  }
}