import 'Kid.dart';

class Exercise {
  Kid _kid;
  Level _exerciseLevel;
  ExerciseName _exerciseName;
  ExerciseType _type;

  Kid get kid => _kid;

  Level get exerciseLevel => _exerciseLevel;

  ExerciseName get exerciseName => _exerciseName;

  ExerciseType get type => _type;
}

// we will use enumeration for better readability
enum Level {
  easy,
  normal,
  hard,
}

enum ExerciseName {
  rememberTheCharacter,
  categorizeTheWord,
  completeTheSentence,
  tanween,
  shaddah,
  openedClosedTaa,
  modood,
  lastLetter,
  describeThePic,
  alPrefix,
  readTheParagraph,
}

enum ExerciseType {
  memory,
  reading,
  grammarSpelling,
}