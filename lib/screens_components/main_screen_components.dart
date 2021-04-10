import 'package:flutter/material.dart';

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
        int before = DateTime.now().millisecondsSinceEpoch;
        Navigator.pushNamed(context, pageName);
        int after = DateTime.now().millisecondsSinceEpoch;
        print(after - before);
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
