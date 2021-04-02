import 'package:dyslexia_app/backend/user.dart';
import 'package:dyslexia_app/authentication_screen/authenticate.dart';
import 'package:dyslexia_app/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // Access the user date from the provider.
    // and accessing to user var every time we get a new value
    final user = Provider.of<User>(context);
    print(user);


    // return either Home or Authenticate Widget
    if(user == null){
      return Authenticate();
    } else{
      return MainScreen();
    }
  }
}
