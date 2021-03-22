class Question {
  String question;
  List<String> choices;
  int answer;

  Question({this.question, this.choices, this.answer});

  bool isCorrect(int answer) {
    return this.answer == answer;
  }
}
