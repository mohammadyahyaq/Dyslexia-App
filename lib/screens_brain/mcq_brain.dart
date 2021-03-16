import 'package:dyslexia_app/backend/Question.dart';
import 'package:dyslexia_app/backend/exercise.dart';

class MCQBrain {
  List<Question> _questions;
  int _currentIndex;

  MCQBrain(ExerciseName exercise) {
    // TODO: this constructor should be remade, where you fitch the data from the database
    if (exercise == ExerciseName.completeTheSentence) {
      String question = 'أنا أنام ...';
      List<String> choices = ['معروفًا', 'مبكرًا', 'بتركيز', 'مبتسمًا'];
      int answers = 1;
      _questions.add(Question(question: question, choices: choices, answers: answers));

      String question1 = '... تساعدون المحتاجين';
      List<String> choices1 = ['نحن', 'هم', 'أنتم', 'أنا'];
      int answers1 = 2;
      _questions.add(Question(question: question1, choices: choices1, answers: answers1));

      String question2 = 'أنتما تسيران ساعة يوميا ... المساء';
      List<String> choices2 = ['عن', 'مع', 'عند', 'على'];
      int answers2 = 2;
      _questions.add(Question(question: question2, choices: choices2, answers: answers2));

      String question3 = 'الطبيبان ... العملية';
      List<String> choices3 = ['أجريا', 'كتبا', 'يعدان', 'وضعا'];
      int answers3 = 0;
      _questions.add(Question(question: question3, choices: choices3, answers: answers3));
    }

    _currentIndex = 0;
  }

  Question getNext() {
    if (_currentIndex != 5) {
      return _questions[_currentIndex++];
    } else {
      return null;
    }
  }
}