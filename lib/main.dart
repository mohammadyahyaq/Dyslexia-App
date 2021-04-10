import 'package:dyslexia_app/backend/exercise.dart';
import 'package:dyslexia_app/backend/stream_provider.dart';
import 'package:dyslexia_app/screens/categorize_words.dart';
import 'package:dyslexia_app/screens/last_letter_screen.dart';
import 'package:dyslexia_app/screens/mcq_screen.dart';
import 'package:dyslexia_app/screens/remember_the_letter_screen.dart';
import 'package:dyslexia_app/screens/result_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'screens/last_letter_screen.dart';
import 'screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'screens/remember_the_letter_screen.dart';
import 'screens_brain/mcq_brain.dart';
import 'backend/exercise.dart';


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
            title: TextStyle(color: Colors.black, fontSize: 20.0),
          ),
        ),
        fontFamily: 'Tajawal',
        primaryColor: Color(0xFFFFFFFF),
        accentColor: Color(0xFFFFBF09),
        cardColor: Color(0xFFFFF8E8),
        cardTheme: CardTheme(
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
        ),
      ),
      initialRoute: AppStreamProvider.id,
      routes: {
        AppStreamProvider.id: (context) => AppStreamProvider(),
        MainScreen.id: (context) => MainScreen(),
        RememberTheLetterScreen.id: (context) => RememberTheLetterScreen(),
        LastLetterScreen.id: (context) => LastLetterScreen(),
        MCQScreen.completeStmId: (context) => MCQScreen(brain: MCQBrain(ExerciseName.completeTheSentence)),
        CategorizeTheWord.id: (context) => CategorizeTheWord(),
        ResultScreen.winId: (context) => ResultScreen(result: Result.win),
        ResultScreen.loseId: (context) => ResultScreen(result: Result.lose),
      },
    );
  }
}
