import 'sender.dart';
import 'kid.dart';
import 'supervised_exercise.dart';

class Supervisor extends Sender {
  int _ratingScore;

  int get ratingScore => _ratingScore;

  bool rateSupervisor() {
    // TODO: implement this method
    throw UnimplementedError();
  }

  @override
  bool sighOut() {
    // TODO: implement sighOut
    throw UnimplementedError();
  }

  bool evaluateExercise(Kid kid, SupervisedExercise exercise, String note) {
    // TODO: implement evaluateExercise
    throw UnimplementedError();
  }
}