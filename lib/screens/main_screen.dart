import 'package:dyslexia_app/screens/mcq_screen.dart';
import 'package:dyslexia_app/screens_components/main_screen_components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {

  static final String id = '/';

  // this variable represents the unlocked levels for the kid
  // note: 1 represents unlocked, and 0 represents locked
  List _levels = [
    [1, 1, 1, 1, 1, 1, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(100, 122),
        child: Padding(
          padding: EdgeInsets.only(top: 40.0, bottom: 20.0),
          child: Padding(
            padding: EdgeInsets.only(right: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'محمد علي',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5.0),
                  child: Text(
                    'المستوى: 50',
                    style: TextStyle(fontSize: 25.0),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
                  child: Divider(
                    color: Colors.black,
                    height: 5.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            HeaderText(content: 'المستوى السهل'),
            Card(
              margin: EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MenuItem(
                        imagePath: 'assets/images/icon.png',
                        itemName: 'ذاكرة الحروف',
                        itemColor: Color(0x33EC4646),
                        isUnLocked: _levels[0][0],
                        pageName: '/rememberTheLetter',
                      ),
                      MenuItem(
                        imagePath: 'assets/images/last letter.png',
                        itemName: 'لعبة الحرف الأخير',
                        itemColor: Color(0x33EC4646),
                        isUnLocked: _levels[0][1],
                        pageName: '/lastLetter',
                      ),
                      MenuItem(
                        imagePath: 'assets/images/describe the picture.png',
                        itemName: 'أوصف الصورة',
                        itemColor: Color(0x33EC4646),
                        isUnLocked: _levels[0][2],
                        pageName: MainScreen.id,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MenuItem(
                        imagePath: 'assets/images/cat.png',
                        itemName: 'جماد حيوان نبات',
                        itemColor: Color(0x332872A1),
                        isUnLocked: _levels[0][3],
                        pageName: MainScreen.id,
                      ),
                      MenuItem(
                        imagePath: 'assets/images/complete stmt.png',
                        itemName: 'أكمل الجمل',
                        itemColor: Color(0x332872A1),
                        isUnLocked: _levels[0][4],
                        pageName: MCQScreen.completeStmId,
                      ),
                      MenuItem(
                        imagePath: 'assets/images/reading.png',
                        itemName: 'تدريب القراءة',
                        itemColor: Color(0x332872A1),
                        isUnLocked: _levels[0][5],
                        pageName: MainScreen.id,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MenuItem(
                        imagePath: 'assets/images/tanween.png',
                        itemName: 'التنوين',
                        itemColor: Color(0x33EDEB5F),
                        isUnLocked: _levels[0][6],
                        pageName: MainScreen.id,
                      ),
                      MenuItem(
                        imagePath: 'assets/images/shaddah.png',
                        itemName: 'الشدة',
                        itemColor: Color(0x33EDEB5F),
                        isUnLocked: _levels[0][7],
                        pageName: MainScreen.id,
                      ),
                      MenuItem(
                        imagePath: 'assets/images/taa.png',
                        itemName: 'التاء المفتوحة\nوالمربوطة',
                        itemColor: Color(0x33EDEB5F),
                        isUnLocked: _levels[0][8],
                        pageName: MainScreen.id,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MenuItem(
                        imagePath: 'assets/images/al prefix.png',
                        itemName: 'ال الشمسية\nوالقمرية',
                        itemColor: Color(0x33EDEB5F),
                        isUnLocked: _levels[0][9],
                        pageName: MainScreen.id,
                      ),
                    ],
                  )
                ],
              ),
            ),
            HeaderText(content: 'المستوى المتوسط'),
            Card(
              margin: EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MenuItem(
                        imagePath: 'assets/images/icon.png',
                        itemName: 'ذاكرة الحروف',
                        itemColor: Color(0x7DEC4646),
                        isUnLocked: _levels[1][0],
                        pageName: MainScreen.id,
                      ),
                      MenuItem(
                        imagePath: 'assets/images/last letter.png',
                        itemName: 'لعبة الحرف الأخير',
                        itemColor: Color(0x7DEC4646),
                        isUnLocked: _levels[1][1],
                        pageName: MainScreen.id,
                      ),
                      MenuItem(
                        imagePath: 'assets/images/describe the picture.png',
                        itemName: 'أوصف الصورة',
                        itemColor: Color(0x7DEC4646),
                        isUnLocked: _levels[1][2],
                        pageName: MainScreen.id,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MenuItem(
                        imagePath: 'assets/images/cat.png',
                        itemName: 'جماد حيوان نبات',
                        itemColor: Color(0x7D2872A1),
                        isUnLocked: _levels[1][3],
                        pageName: MainScreen.id,
                      ),
                      MenuItem(
                        imagePath: 'assets/images/complete stmt.png',
                        itemName: 'أكمل الجمل',
                        itemColor: Color(0x7D2872A1),
                        isUnLocked: _levels[1][4],
                        pageName: MCQScreen.completeStmId,
                      ),
                      MenuItem(
                        imagePath: 'assets/images/reading.png',
                        itemName: 'تدريب القراءة',
                        itemColor: Color(0x7D2872A1),
                        isUnLocked: _levels[1][5],
                        pageName: MainScreen.id,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MenuItem(
                        imagePath: 'assets/images/tanween.png',
                        itemName: 'التنوين',
                        itemColor: Color(0x7DEDEB5F),
                        isUnLocked: _levels[1][6],
                        pageName: MainScreen.id,
                      ),
                      MenuItem(
                        imagePath: 'assets/images/shaddah.png',
                        itemName: 'الشدة',
                        itemColor: Color(0x7DEDEB5F),
                        isUnLocked: _levels[1][7],
                        pageName: MainScreen.id,
                      ),
                      MenuItem(
                        imagePath: 'assets/images/taa.png',
                        itemName: 'التاء المفتوحة\nوالمربوطة',
                        itemColor: Color(0x7DEDEB5F),
                        isUnLocked: _levels[1][8],
                        pageName: MainScreen.id,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MenuItem(
                        imagePath: 'assets/images/al prefix.png',
                        itemName: 'ال الشمسية\nوالقمرية',
                        itemColor: Color(0x7DEDEB5F),
                        isUnLocked: _levels[1][9],
                        pageName: MainScreen.id,
                      ),
                    ],
                  )
                ],
              ),
            ),
            HeaderText(content: 'المستوى الصعب'),
            Card(
              margin: EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MenuItem(
                        imagePath: 'assets/images/icon.png',
                        itemName: 'ذاكرة الحروف',
                        itemColor: Color(0xC8EC4646),
                        isUnLocked: _levels[2][0],
                        pageName: MainScreen.id,
                      ),
                      MenuItem(
                        imagePath: 'assets/images/last letter.png',
                        itemName: 'لعبة الحرف الأخير',
                        itemColor: Color(0xC8EC4646),
                        isUnLocked: _levels[2][1],
                        pageName: MainScreen.id,
                      ),
                      MenuItem(
                        imagePath: 'assets/images/describe the picture.png',
                        itemName: 'أوصف الصورة',
                        itemColor: Color(0xC8EC4646),
                        isUnLocked: _levels[2][2],
                        pageName: MainScreen.id,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MenuItem(
                        imagePath: 'assets/images/cat.png',
                        itemName: 'جماد حيوان نبات',
                        itemColor: Color(0xC82872A1),
                        isUnLocked: _levels[2][3],
                        pageName: MainScreen.id,
                      ),
                      MenuItem(
                        imagePath: 'assets/images/complete stmt.png',
                        itemName: 'أكمل الجمل',
                        itemColor: Color(0xC82872A1),
                        isUnLocked: _levels[2][4],
                        pageName: MainScreen.id,
                      ),
                      MenuItem(
                        imagePath: 'assets/images/reading.png',
                        itemName: 'تدريب القراءة',
                        itemColor: Color(0xC82872A1),
                        isUnLocked: _levels[2][5],
                        pageName: MainScreen.id,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MenuItem(
                        imagePath: 'assets/images/tanween.png',
                        itemName: 'التنوين',
                        itemColor: Color(0xC8EDEB5F),
                        isUnLocked: _levels[2][6],
                        pageName: MainScreen.id,
                      ),
                      MenuItem(
                        imagePath: 'assets/images/shaddah.png',
                        itemName: 'الشدة',
                        itemColor: Color(0xC8EDEB5F),
                        isUnLocked: _levels[2][7],
                        pageName: MainScreen.id,
                      ),
                      MenuItem(
                        imagePath: 'assets/images/taa.png',
                        itemName: 'التاء المفتوحة\nوالمربوطة',
                        itemColor: Color(0xC8EDEB5F),
                        isUnLocked: _levels[2][8],
                        pageName: MainScreen.id,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MenuItem(
                        imagePath: 'assets/images/al prefix.png',
                        itemName: 'ال الشمسية\nوالقمرية',
                        itemColor: Color(0xC8EDEB5F),
                        isUnLocked: _levels[2][9],
                        pageName: MainScreen.id,
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}