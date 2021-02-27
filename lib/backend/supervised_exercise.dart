import 'exercise.dart';

class SupervisedExercise extends Exercise {
  List<ExerciseSolution> _solutions;

  List<ExerciseSolution> get solutions => _solutions;
}

class ExerciseSolution {
  String _solution;

  String get solution => _solution;
}