import 'user.dart';
import 'package:email_validator/email_validator.dart';

abstract class Adult extends User {
  String _email;

  String getEmail() {
    return this._email;
  }

  String signIn(String email, String password) {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  bool signUp(String email, String firstName, String lastName, String password, String confirmPassword, String type) {
    // TODO: implement singUp
    throw UnimplementedError();
  }

  // TODO: this method should be moved to the signUp page and it should show the error message in the UI
  bool signUpValidation(String email, String firstName, String lastName, String password, String confirmPassword, String type) {
    // client side input validation
    if(!EmailValidator.validate(email)) {
      return false;
    }
    RegExp arabicRegex = new RegExp(r'[\u0621-\u064A]+'); // This regex validates if the word is arabic or not
    if(!(arabicRegex.allMatches(firstName).length == 1 && arabicRegex.allMatches(firstName).first.group(0) == firstName)) {
      return false;
    }
    if(!(arabicRegex.allMatches(lastName).length == 1 && arabicRegex.allMatches(lastName).first.group(0) == lastName)) {
      return false;
    }
    if(password != confirmPassword) {
      return false;
    }
    if(type != 'Parent' || type != 'supervisor') {
      return false;
    }
    return true;
  }

  @override
  bool sighOut() {
    // TODO: implement sighOut
    throw UnimplementedError();
  }

}