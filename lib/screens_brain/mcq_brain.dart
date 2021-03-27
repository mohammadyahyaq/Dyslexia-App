import 'package:dyslexia_app/backend/Question.dart';
import 'package:dyslexia_app/backend/exercise.dart';
import 'package:dyslexia_app/screens/result_screen.dart';
import 'package:dyslexia_app/screens_components/mcq_screen_components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MCQBrain {
  List<Question> _questions;
  List<int> _progress;
  int _currentIndex;

  BuildContext _context;
  int result = 0;

  Function setState;
  List<Widget> questionWidgets;
  List<Widget> progressBarWidgets;

  AnimationController answerController;
  List<Color> choicesColor;

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
        Question(question: question3, choices: choices3, answer: answers3),
      );
    }

    _progress = [];
    for (int i = 0; i < _questions.length; i++) {
      _progress.add(0);
    }
    _currentIndex = 0;
  }

  void setEssential(Function setState, AnimationController answerController) {
    this.setState = setState;
    this.answerController = answerController;

    choicesColor = []; // we have to initialize the list
    questionWidgets = generateQuestionWidgets();
    progressBarWidgets = generateProgressBar();
  }


  set context(BuildContext value) {
    _context = value;
  }

  void _goNext() {
    if (_currentIndex < _questions.length - 1) {
      _currentIndex++;
    } else {
      if(result == _progress.length){
        Navigator.pushNamed(_context, ResultScreen.winId);
      } else {
        Navigator.pushNamed(_context, ResultScreen.loseId);
      }
    }
    setState((){
      questionWidgets = generateQuestionWidgets();
    });
  }

  List<Widget> generateProgressBar() {
    List<Widget> progressList = [];
    for (int i = 0; i < _progress.length; i++) {
      progressList.add(Expanded(
        child: Container(
          color: (_progress[i] == 0)
              ? Color(0xFFFFF8E8)
              : (_progress[i] == 1)
                  ? Color(0xFF5EB693)
                  : Color(0xFFFF5F3D),
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

  List<Widget> generateQuestionWidgets() {
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

    choicesColor = [];
    for (int i = 0; i < _questions[_currentIndex].choices.length; i++) {
      choicesColor.add(Colors.white);
      questionWidgets.add(
        GestureDetector(
          onTap: () {
            // // step 1: start the animation
            // Color resultColor;
            // if(_questions[_currentIndex].isCorrect(i)) {
            //   resultColor = Color(0xFF5EB693);
            // } else {
            //   resultColor = Color(0xFFFF5F3D);
            // }
            // setState((){
            //   choicesColor[i] = resultColor;
            // });
            // answerController.addStatusListener((status) {
            //   if(status == AnimationStatus.completed) {
            //     setState((){
            //       choicesColor[i] = Colors.white;
            //     });
            //   }
            // });
            // answerController.forward();

            // step 2: update the progress bar
            if (_questions[_currentIndex].isCorrect(i)) {
              result++;
              _progress[_currentIndex] = 1; // set to correct
              setState(() {
                progressBarWidgets = generateProgressBar();
              });
            } else {
              _progress[_currentIndex] = 2; // set inCorrect
              setState(() {
                progressBarWidgets = generateProgressBar();
              });
            }

            // step 3: go to the next question
            _goNext();
          },
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
            child: Choice(
              choiceText: _questions[_currentIndex].choices[i],
              choiceColor: choicesColor[i],
            ),
          ),
        ),
      );
    }
    return questionWidgets;
  }

  // // this method is responsible for flushing animation
  // void flushAnimation(int index) {
  //   Color resultColor;
  //   if(_questions[_currentIndex].isCorrect(index)) {
  //     resultColor = Color(0xFF5EB693);
  //   } else {
  //     resultColor = Color(0xFFFF5F3D);
  //   }
  //   if (answerController.value < 0.25) {
  //     setState((){
  //       choicesColor[index] = resultColor;
  //     });
  //   } else if(answerController.value >= 0.25 && answerController.value < 0.3) {
  //     setState(() {
  //       choicesColor[index] = Colors.white;
  //     });
  //   } else if(answerController.value >= 0.3 && answerController.value < 0.45) {
  //     setState((){
  //       choicesColor[index] = resultColor;
  //     });
  //   } else if(answerController.value >= 0.45 && answerController.value < 0.5) {
  //     setState(() {
  //       choicesColor[index] = Colors.white;
  //     });
  //   } else if(answerController.value >= 0.5 && answerController.value < 0.75){
  //     setState((){
  //       choicesColor[index] = resultColor;
  //     });
  //   } else if(answerController.value >= 0.75 && answerController.value < 0.8){
  //     setState(() {
  //       choicesColor[index] = Colors.white;
  //     });
  //   } else {
  //     setState((){
  //       choicesColor[index] = resultColor;
  //     });
  //   }
  // }
}
