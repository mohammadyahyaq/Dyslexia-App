abstract class User {
  String _firstName;
  String _lastName;
  Gender _gender;


  String get firstName => _firstName;

  String get lastName => _lastName;

  Gender get gender => _gender;

  bool sighOut();
}

// We will use enumeration for the gender object
enum Gender {
  male,
  female,
}