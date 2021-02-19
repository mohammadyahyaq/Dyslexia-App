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

  int getTotalScore() {
    return this._totalScore;
  }

  int getMemoryScore() {
    return this._memoryScore;
  }

  int getReadingScore() {
    return this._readingScore;
  }

  int getGrammarSpellScore() {
    return this._grammarSpellScore;
  }

  Supervisor getSupervisor() {
    return this._supervisor;
  }

  bool signIn(String parentEmail, String userName, String password) {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  bool sighOut() {
    // TODO: implement sighOut
    throw UnimplementedError();
  }}