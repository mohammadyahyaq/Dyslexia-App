import 'user.dart';
import 'supervisor.dart';

class Kid extends User {
  // Score variables
  int _totalScore;
  int _memoryScore;
  int _readingScore;
  int _grammarSpellScore;
  // Other info
  Supervisor _supervisor;

  int get totalScore => _totalScore;

  int get memoryScore => _memoryScore;

  int get readingScore => _readingScore;

  int get grammarSpellScore => _grammarSpellScore;

  Supervisor get supervisor => _supervisor;

  bool signIn(String parentEmail, String userName, String password) {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  bool sighOut() {
    // TODO: implement sighOut
    throw UnimplementedError();
  }
}
