class User {

  final String uid;

  // this user is a new a instance for auth object in FirebaseAuth and passing uid through the User instance.
  User({this.uid});

}

// We will use enumeration for the gender object
enum Gender {
  male,
  female,
}

// ########################## old code ##########################

// We will use enumeration for the gender object
// enum Gender {
//   male,
//   female,
// }
// abstract class User {
//   String _firstName;
//   String _lastName;
//   Gender _gender;
//
//
//   String get firstName => _firstName;
//
//   String get lastName => _lastName;
//
//   Gender get gender => _gender;
//
//   bool sighOut();
// }
