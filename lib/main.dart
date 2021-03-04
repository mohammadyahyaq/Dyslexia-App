import 'package:flutter_localizations/flutter_localizations.dart';

import 'screens/main_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'عسر القراءة',
      // we should use localization to convert the app to Right to Left format
      localizationsDelegates: [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('ar', ''), // Arabic, no country specified
      ],
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          shadowColor: Color(0x00FFFFFF),
          color: Colors.white,
          textTheme: TextTheme(
            title: TextStyle(
              color: Colors.black,
              fontSize: 20.0
            ),
          ),
        ),
        fontFamily: 'Tajawal',
        primaryColor: Color(0xFFFFFFFF),
        accentColor: Color(0xFFFFBF09),
        cardColor: Color(0xFFFFF8E8),
        cardTheme: CardTheme(
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
      ),
      initialRoute: '/',
      routes: {'/': (context) => MainScreen()},
    );
  }
}