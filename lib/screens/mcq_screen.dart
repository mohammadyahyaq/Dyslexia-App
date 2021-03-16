import 'package:dyslexia_app/screens_brain/mcq_brain.dart';
import 'package:flutter/material.dart';

class MCQScreen extends StatefulWidget {

  MCQBrain brain;

  MCQScreen({this.brain});

  @override
  _MCQScreenState createState() => _MCQScreenState();
}

class _MCQScreenState extends State<MCQScreen> {
  MCQBrain brain;

  @override
  void initState() {
    brain = widget.brain;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
