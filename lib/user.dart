abstract class User {
  String _firstName;
  String _lastName;
  String _gender;

  String getFirstName() {
    return this._firstName;
  }

  String getLastName() {
    return this._lastName;
  }

  String getGender() {
    return this._gender;
  }

  bool sighOut();
}