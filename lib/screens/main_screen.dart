import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  // this variable represents the unlocked levels for the kid
  // note: 1 represents unlocked, and 0 represents locked
  List levels = [
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
                        isUnLocked: levels[0][0],
                        pageName: '/rememberTheLetter',
                      ),
                      MenuItem(
                        imagePath: 'assets/images/last letter.png',
                        itemName: 'لعبة الحرف الأخير',
                        itemColor: Color(0x33EC4646),
                        isUnLocked: levels[0][1],
                        pageName: '/lastLetter',
                      ),
                      MenuItem(
                        imagePath: 'assets/images/describe the picture.png',
                        itemName: 'أوصف الصورة',
                        itemColor: Color(0x33EC4646),
                        isUnLocked: levels[0][2],
                        pageName: '/',
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
                        isUnLocked: levels[0][3],
                        pageName: '/',
                      ),
                      MenuItem(
                        imagePath: 'assets/images/complete stmt.png',
                        itemName: 'أكمل الجمل',
                        itemColor: Color(0x332872A1),
                        isUnLocked: levels[0][4],
                        pageName: '/',
                      ),
                      MenuItem(
                        imagePath: 'assets/images/reading.png',
                        itemName: 'تدريب القراءة',
                        itemColor: Color(0x332872A1),
                        isUnLocked: levels[0][5],
                        pageName: '/',
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
                        isUnLocked: levels[0][6],
                        pageName: '/',
                      ),
                      MenuItem(
                        imagePath: 'assets/images/shaddah.png',
                        itemName: 'الشدة',
                        itemColor: Color(0x33EDEB5F),
                        isUnLocked: levels[0][7],
                        pageName: '/',
                      ),
                      MenuItem(
                        imagePath: 'assets/images/taa.png',
                        itemName: 'التاء المفتوحة\nوالمربوطة',
                        itemColor: Color(0x33EDEB5F),
                        isUnLocked: levels[0][8],
                        pageName: '/',
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
                        isUnLocked: levels[0][9],
                        pageName: '/',
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
                        isUnLocked: levels[1][0],
                        pageName: '/',
                      ),
                      MenuItem(
                        imagePath: 'assets/images/last letter.png',
                        itemName: 'لعبة الحرف الأخير',
                        itemColor: Color(0x7DEC4646),
                        isUnLocked: levels[1][1],
                        pageName: '/',
                      ),
                      MenuItem(
                        imagePath: 'assets/images/describe the picture.png',
                        itemName: 'أوصف الصورة',
                        itemColor: Color(0x7DEC4646),
                        isUnLocked: levels[1][2],
                        pageName: '/',
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
                        isUnLocked: levels[1][3],
                        pageName: '/',
                      ),
                      MenuItem(
                        imagePath: 'assets/images/complete stmt.png',
                        itemName: 'أكمل الجمل',
                        itemColor: Color(0x7D2872A1),
                        isUnLocked: levels[1][4],
                        pageName: '/',
                      ),
                      MenuItem(
                        imagePath: 'assets/images/reading.png',
                        itemName: 'تدريب القراءة',
                        itemColor: Color(0x7D2872A1),
                        isUnLocked: levels[1][5],
                        pageName: '/',
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
                        isUnLocked: levels[1][6],
                        pageName: '/',
                      ),
                      MenuItem(
                        imagePath: 'assets/images/shaddah.png',
                        itemName: 'الشدة',
                        itemColor: Color(0x7DEDEB5F),
                        isUnLocked: levels[1][7],
                        pageName: '/',
                      ),
                      MenuItem(
                        imagePath: 'assets/images/taa.png',
                        itemName: 'التاء المفتوحة\nوالمربوطة',
                        itemColor: Color(0x7DEDEB5F),
                        isUnLocked: levels[1][8],
                        pageName: '/',
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
                        isUnLocked: levels[1][9],
                        pageName: '/',
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
                        isUnLocked: levels[2][0],
                        pageName: '/',
                      ),
                      MenuItem(
                        imagePath: 'assets/images/last letter.png',
                        itemName: 'لعبة الحرف الأخير',
                        itemColor: Color(0xC8EC4646),
                        isUnLocked: levels[2][1],
                        pageName: '/',
                      ),
                      MenuItem(
                        imagePath: 'assets/images/describe the picture.png',
                        itemName: 'أوصف الصورة',
                        itemColor: Color(0xC8EC4646),
                        isUnLocked: levels[2][2],
                        pageName: '/',
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
                        isUnLocked: levels[2][3],
                        pageName: '/',
                      ),
                      MenuItem(
                        imagePath: 'assets/images/complete stmt.png',
                        itemName: 'أكمل الجمل',
                        itemColor: Color(0xC82872A1),
                        isUnLocked: levels[2][4],
                        pageName: '/',
                      ),
                      MenuItem(
                        imagePath: 'assets/images/reading.png',
                        itemName: 'تدريب القراءة',
                        itemColor: Color(0xC82872A1),
                        isUnLocked: levels[2][5],
                        pageName: '/',
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
                        isUnLocked: levels[2][6],
                        pageName: '/',
                      ),
                      MenuItem(
                        imagePath: 'assets/images/shaddah.png',
                        itemName: 'الشدة',
                        itemColor: Color(0xC8EDEB5F),
                        isUnLocked: levels[2][7],
                        pageName: '/',
                      ),
                      MenuItem(
                        imagePath: 'assets/images/taa.png',
                        itemName: 'التاء المفتوحة\nوالمربوطة',
                        itemColor: Color(0xC8EDEB5F),
                        isUnLocked: levels[2][8],
                        pageName: '/',
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
                        isUnLocked: levels[2][9],
                        pageName: '/',
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

class HeaderText extends StatelessWidget {
  final String content;
  HeaderText({@required this.content});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15.0),
      child: Text(
        content,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final String imagePath;
  final String itemName;
  final Color itemColor;
  final int isUnLocked;
  final String pageName;

  MenuItem(
      {@required this.imagePath,
      @required this.itemName,
      @required this.itemColor,
      @required this.isUnLocked,
      @required this.pageName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (isUnLocked == 1)
          ? () {
              Navigator.pushNamed(context, pageName);
            }
          : () {
              //do nothing
            },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: (isUnLocked == 1) ? itemColor : Colors.grey[300],
              ),
              width: 70.0,
              height: 70.0,
              child: Padding(
                padding: (isUnLocked == 1) ? EdgeInsets.all(5.0) : EdgeInsets.all(20.0),
                child: Image(
                  image: (isUnLocked == 1)
                      ? AssetImage(imagePath)
                      : AssetImage('assets/images/locked.png'),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 0.0),
              child: Text(
                itemName,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
