abstract class User {
  String _firstName;
  String _lastName;
  Gender _gender;

  String getFirstName() {
    return this._firstName;
  }

  String getLastName() {
    return this._lastName;
  }

  Gender getGender() {
    return this._gender;
  }

  bool sighOut();
}

// We will use enumeration for the gender object
enum Gender {
  male,
  female,
}