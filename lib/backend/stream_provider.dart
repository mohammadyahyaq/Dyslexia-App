import 'package:dyslexia_app/backend/user.dart';
import 'wrapper.dart';
import 'package:dyslexia_app/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class AppStreamProvider extends StatelessWidget {

  static String id = '/';

  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
