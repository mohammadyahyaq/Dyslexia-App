import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

class RememberTheLetterScreen extends StatefulWidget {

  static String id = '/kid/rememberTheLetter';

  @override
  _RememberTheLetterScreenState createState() =>
      _RememberTheLetterScreenState();
}

class _RememberTheLetterScreenState extends State<RememberTheLetterScreen> {
  List<GlobalKey<FlipCardState>> listk = [];
  List<Color> answerColor = [];

  @override
  void initState() {
    listk.add(GlobalKey<FlipCardState>());
    listk.add(GlobalKey<FlipCardState>());
    listk.add(GlobalKey<FlipCardState>());
    listk.add(GlobalKey<FlipCardState>());

    for (int i = 0; i < listk.length; i++) {
      answerColor.add(Colors.black26);
    }
    startTimer();
    super.initState();
  }

  Timer _timer;
  int _start = 10;
  int flip = 0;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0 && flip == 0) {
          setState(() {
            listk[0].currentState.setState(() {
              listk[0].currentState.toggleCard();
            });
            listk[1].currentState.setState(() {
              listk[1].currentState.toggleCard();
            });
            listk[2].currentState.setState(() {
              listk[2].currentState.toggleCard();
            });
            listk[3].currentState.setState(() {
              listk[3].currentState.toggleCard();
            });
            flip = 1;
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: Center(child: Text("memory")),
      ),
      body: SafeArea(
        child: Center(
          child: GridView(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            children: <Widget>[
              SizedBox(
                width: 50,
              ),
              Flex(
                direction: Axis.horizontal,
                children: [
                  Text("$_start",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                        fontSize: 40,
                      ))
                ],
              ),
              GestureDetector(
                child: FlipCard(
                  direction: FlipDirection.VERTICAL,
                  flipOnTouch: false,
                  key: (listk[0]),
                  front: frontCard("ش", 0),
                  back: backCard(0),
                ),
              ),
              GestureDetector(
                child: FlipCard(
                  direction: FlipDirection.VERTICAL,
                  flipOnTouch: false,
                  key: (listk[1]),
                  front: frontCard("", 1),
                  back: backCard(1),
                ),
              ),
              GestureDetector(
                child: FlipCard(
                  direction: FlipDirection.VERTICAL,
                  flipOnTouch: false,
                  key: (listk[2]),
                  front: frontCard("", 2),
                  back: backCard(2),
                ),
              ),
              GestureDetector(
                child: FlipCard(
                  direction: FlipDirection.VERTICAL,
                  flipOnTouch: false,
                  key: (listk[3]),
                  front: frontCard("ج", 3),
                  back: backCard(3),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget frontCard(String letter, int index) {
    return Card(
      color: answerColor[index],
      elevation: 10,
      child: Center(
        child: Text(
          "$letter",
          style: TextStyle(color: Colors.white, fontSize: 50),
        ),
      ),
    );
  }

  Widget backCard(int index) {
    final TextEditingController _controller = new TextEditingController();

    return Card(
      color: Colors.teal,
      elevation: 10,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.white70, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Column(children: [
          Icon(
            Icons.build,
            color: Colors.green,
            size: 30.0,
          ),
          TextField(
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
            controller: _controller,
            onTap: () {
              _controller.clear();
            },
            onSubmitted: (String s) {
              setState(() {
                answerColor[index] = (s == "gg") ? Colors.green : Colors.red;
              });

              listk[index].currentState.setState(() {
                listk[index].currentState.toggleCard();
              });
            },
          ),
        ]),
      ),
    );
  }
}
