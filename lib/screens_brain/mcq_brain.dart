import 'package:dyslexia_app/backend/Question.dart';
import 'package:dyslexia_app/backend/exercise.dart';
import 'package:dyslexia_app/screens_components/mcq_screen_components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MCQBrain {
  List<Question> _questions;
  List<int> _progress;
  int _currentIndex;

  MCQBrain(ExerciseName exercise) {
    // TODO: this constructor should be remade, where you fitch the data from the database
    _questions = [];
    if (exercise == ExerciseName.completeTheSentence) {
      String question = 'أنا أنام ...';
      List<String> choices = ['معروفًا', 'مبكرًا', 'بتركيز', 'مبتسمًا'];
      int answers = 1;
      _questions
          .add(Question(question: question, choices: choices, answer: answers));

      String question1 = '... تساعدون المحتاجين';
      List<String> choices1 = ['نحن', 'هم', 'أنتم', 'أنا'];
      int answers1 = 2;
      _questions.add(
          Question(question: question1, choices: choices1, answer: answers1));

      String question2 = 'أنتما تسيران ساعة يوميا ... المساء';
      List<String> choices2 = ['عن', 'مع', 'عند', 'على'];
      int answers2 = 2;
      _questions.add(
          Question(question: question2, choices: choices2, answer: answers2));

      String question3 = 'الطبيبان ... العملية';
      List<String> choices3 = ['أجريا', 'كتبا', 'يعدان', 'وضعا'];
      int answers3 = 0;
      _questions.add(
          Question(question: question3, choices: choices3, answer: answers3));
    }

    _progress = [];
    for (int i = 0; i < _questions.length; i++) {
      _progress.add(0);
    }

    _currentIndex = 0;
  }

  List<Widget> generateWidgets() {
    List<Widget> questionWidgets = [
      Padding(
        padding: EdgeInsets.only(bottom: 20.0),
        child: Text(
          _questions[_currentIndex].question,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 40.0,
            color: Colors.black,
          ),
        ),
      ),
    ];

    for (int i = 0; i < _questions[_currentIndex].choices.length; i++) {
      questionWidgets.add(
        GestureDetector(
          onTap: () {
            if (_questions[_currentIndex].isCorrect(i)) {
              setState() {
                _progress[i] = 1; // set to correct
              }
            } else {
              setState() {
                _progress[i] = 0; // set inCorrect
              }
            }
          },
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
            child: Choice(
              choiceText: _questions[_currentIndex].choices[i],
            ),
          ),
        ),
      );
    }
    return questionWidgets;
  }

  Question _getNext() {
    if (_currentIndex < _questions.length) {
      return _questions[_currentIndex++];
    } else {
      return null;
    }
  }

  List<Widget> generateProgressBar() {
    List<Widget> progressList = List<Widget>();
    for (int i = 0; i < _progress.length; i++) {
      progressList.add(Expanded(
        child: Container(
          color: (_progress[i] == 0) ? Color(0xFFFFF8E8) : (_progress[i] == 1) ? Color(0xFF5EB693) : Color(0xFFFF5F3D),
          height: 20.0,
        ),
      ));
      if (i != _progress.length - 1) {
        progressList.add(
          SizedBox(
            width: 5.0,
          ),
        );
      }
    }
    return progressList;
  }
}
