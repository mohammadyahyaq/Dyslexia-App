import 'package:dyslexia_app/backend/Question.dart';
import 'package:dyslexia_app/screens_brain/mcq_brain.dart';
import 'package:dyslexia_app/screens_components/mcq_screen_components.dart';
import 'package:flutter/material.dart';

class MCQScreen extends StatefulWidget {

  static final String completeStmId = '/mcq_screen/complete_stmt';
  static final String tanweenId = '/mcq_screen/tanween';

  MCQBrain brain;

  MCQScreen({@required this.brain});

  @override
  _MCQScreenState createState() => _MCQScreenState();
}

class _MCQScreenState extends State<MCQScreen> {

  MCQBrain brain;
  List<Widget> questionWidgets;
  List<Widget> progressBarWidgets;

  @override
  void initState() {
    brain = widget.brain;
    questionWidgets = generateQuestionWidgets();
    progressBarWidgets = brain.generateProgressBar();
    super.initState();
  }

  void update() {
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFBF09),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: questionWidgets,
            ),
          ),
          Row(
            children: progressBarWidgets,
          ),
        ],
      ),
    );
  }

  // TODO: this method should be moved to MCQBrain class, because it is highly dependent on it!
  // Note: The problem is that if we moved it we sill have a problem with calling setState method outside this class
  List<Widget> generateQuestionWidgets() {
    List<Widget> questionWidgets = [
      Padding(
        padding: EdgeInsets.only(bottom: 20.0),
        child: Text(
          brain.getCurrentQuestion().question,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 40.0,
            color: Colors.black,
          ),
        ),
      ),
    ];

    for (int i = 0; i < brain.getCurrentQuestion().choices.length; i++) {
      questionWidgets.add(
        GestureDetector(
          onTap: () {
            if (brain.getCurrentQuestion().isCorrect(i)) {
              brain.setProgress(1, i); // set to correct
              setState(() {
                progressBarWidgets = brain.generateProgressBar();
              });
            } else {
              brain.setProgress(0, i); // set inCorrect
              setState(() {
                progressBarWidgets = brain.generateProgressBar();
              });
            }
          },
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
            child: Choice(
              choiceText: brain.getCurrentQuestion().choices[i],
            ),
          ),
        ),
      );
    }
    return questionWidgets;
  }
}
