import 'package:dyslexia_app/Kid.dart';

class Exercise {
  Kid _kid;
  Level _exerciseLevel;
  String _exerciseName;
  String _exerciseDescription;
  ExerciseType _type;

  Kid get kid => _kid;

  Level get exerciseLevel => _exerciseLevel;

  String get exerciseName => _exerciseName;

  String get exerciseDescription => _exerciseDescription;

  ExerciseType get type => _type;
}

// we will use enumeration for better readability
enum Level {
  easy,
  normal,
  hard,
}

enum ExerciseType {
  memory,
  reading,
  grammarSpelling,
}