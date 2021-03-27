import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/* // These imports belong to the audio and permission plugins.
import 'package:record_mp3/record_mp3.dart';
import 'dart:async';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';
 */
class LastLetterScreen extends StatefulWidget {
  @override
  _LastLetterScreenState createState() => _LastLetterScreenState();
}

class Words {
  String text;
  bool type;

  Words(String t, bool y) {
    text = t;
    type = y;
  }
}

class Words_bank {
  int _wordNumber = 0;

  List<Words> _wordsBank = [
    Words('مدرسة', true),
    Words('سيارة', true),
    Words(
        'ذهب محمد إلى السوق، واشترى من المكتبة مسطرة وقلمًا،'
        ' واشترى من البقالة مشمشًا. نزل المطر؛ فحمل محمد المظلة.',
        false),
  ];

  void nextWord() {
    if (_wordNumber < _wordsBank.length - 1) {
      _wordNumber++;
    }
  }

  bool isFinished() {
    if (_wordNumber == _wordsBank.length - 1) {
      return true;
    }
    return false;
  }

  void reset() {
    _wordNumber = 0;
  }

  String getWordText() {
    return _wordsBank[_wordNumber].text;
  }

  String getWordType() {
    if (_wordsBank[_wordNumber].type == true) {
      return 'الكلمة التالية';
    }
    return 'النص التالي';
  }
}

Words_bank wordsBank = Words_bank();

Decoration inkBox() {
  return BoxDecoration(
    border: Border.all(color: Colors.black, width: 3),
    color: Colors.grey,
    shape: BoxShape.circle,
  );
}

class _LastLetterScreenState extends State<LastLetterScreen> {
  bool pressed = false;

  /*
  // These two variables belongs to the Audio plugins.
  String statusText = "";
  bool isComplete = false;
   */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFBF09),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFFFFBF09),
        title: Text('تمرين الإستماع'),
        automaticallyImplyLeading: false,
        //backgroundColor: Colors.grey[700],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              wordsBank.getWordType(),
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Colors.green[800],
                fontWeight: FontWeight.bold,
                fontSize: 40.0,
              ),
            ),
            Text(
              wordsBank.getWordText(),
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            pressed
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Ink(
                        decoration: inkBox(),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              pressed = false;
                            });
                          },
                          icon: Icon(
                            Icons.replay,
                            color: Colors.black,
                            size: 40.0,
                          ),
                          iconSize: 40.0,
                        ),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Ink(
                        decoration: inkBox(),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              if (wordsBank.isFinished()) {
                              } else {
                                pressed = false;
                                wordsBank.nextWord();
                              }
                            });
                          },
                          icon: Icon(
                            Icons.play_arrow,
                            color: Colors.black,
                            size: 60.0,
                          ),
                          iconSize: 60.0,
                        ),
                      ),
                    ],
                  )
                : Ink(
                    decoration: inkBox(),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          pressed = true;
                        });
                      },
                      icon: Icon(
                        Icons.mic,
                        color: Colors.black,
                        size: 60.0,
                      ),
                      iconSize: 60.0,
                    ),
                  ),
          ],
        ),
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: FloatingActionButton(
                backgroundColor: Colors.red[700],
                shape: CircleBorder(
                  side: BorderSide(color: Colors.black, width: 3.0),
                ),
                onPressed: () {
                  setState(() {
                    pressed = false;
                    wordsBank.reset();
                    Navigator.pop(context);
                  });
                },
                // tooltip: 'Increment',
                child: Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 35.0,
                ),
                heroTag: null,
              ),
            ),
          ),
          SizedBox(
            height: double.minPositive,
          ),
          if (pressed)
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: FloatingActionButton(
                    backgroundColor: Colors.green[700],
                    shape: CircleBorder(
                      side: BorderSide(color: Colors.black, width: 3.0),
                    ),
                    onPressed: () {
                      setState(() {
                        pressed = false;
                        wordsBank.nextWord();
                      });
                    },
                    // tooltip: 'Increment',
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 35.0,
                    ),
                    heroTag: null,
                  ),
                ),
              ),
            ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

/*
  Future<bool> checkPermission() async {
    if (!await Permission.microphone.isGranted) {
      PermissionStatus status = await Permission.microphone.request();
      if (status != PermissionStatus.granted) {
        return false;
      }
    }
    return true;
  }

  void startRecord() async {
    bool hasPermission = await checkPermission();
    if (hasPermission) {
      statusText = "Recording...";
      recordFilePath = await getFilePath();
      isComplete = false;
      RecordMp3.instance.start(recordFilePath, (type) {
        statusText = "Record error--->$type";
        setState(() {});
      });
    } else {
      statusText = "No microphone permission";
    }
    setState(() {});
  }
  */

/*
import 'package:flutter/material.dart';

class LastLetterScreen extends StatefulWidget {
  @override
  _LastLetterScreenState createState() => _LastLetterScreenState();
}

class _LastLetterScreenState extends State<LastLetterScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: make this page
    return Scaffold();
  }
}

 */
}
