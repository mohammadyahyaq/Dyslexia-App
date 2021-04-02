import 'package:flutter/material.dart';

class CategorizeTheWord extends StatefulWidget {
  static final id = '/kid/CategorizeTheWord';

  @override
  _CategorizeTheWordState createState() => _CategorizeTheWordState();
}

// This is where this program begins.

/* The typeContainer is used for the container label for each the
four 'إنسان', 'حيوان', 'نبات', 'جماد' respectively */
Container typeContainer(String type) {
  return Container(
    alignment: Alignment.center,
    color: Colors.grey[50],
    child: Text(
      type,
      style: TextStyle(
        fontSize: 27.0,
        backgroundColor: Colors.grey[50],
      ),
    ),
  );
}

/* This whiteContainer stores the details of the white background for the
tableRow. */
Container whiteContainer(Widget widget) {
  return Container(
    color: Colors.white,
    height: 150.0,
    child: widget,
  );
}

// This grey container stores the details of the background for the DragTarget.
Container greyContainer(Widget widget) {
  return Container(
    color: Colors.grey[300],
    height: 70.0,
    child: widget,
  );
}

// This padding function is used to store the padding details for the tables.
Padding padding(double vertical, double horizontal, Widget widget) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
    child: widget,
  );
}

// The four functions below are made specifically for the words cards in top.
Card wordCard(String word) {
  return Card(
    color: Colors.deepOrange,
    margin: EdgeInsets.all(5.0),
    child: wordPadding(word),
  );
}

Padding wordPadding(String word) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: wordText(word),
  );
}

Text wordText(String word) {
  return Text(
    word,
    style: wordStyle(),
  );
}

TextStyle wordStyle() {
  return TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );
}
//////////////////////////////////////////////////

/* This emptyDraggable is used to replace the Draggable value once the
 Draggable card is dragged to the DragTarget so it could 'empty' it. */
Draggable emptyDraggable() {
  return Draggable(
    data: 11,
    child: Card(),
    childWhenDragging: Container(),
    feedback: Card(),
  );
}

class _CategorizeTheWordState extends State<CategorizeTheWord> {
  /* This list will hold the Draggable contents. */
  List<Draggable> wordBank = [
    Draggable(
      data: 0,
      child: wordCard('كتاب'),
      childWhenDragging: Container(),
      feedback: wordCard('كتاب'),
    ),
    Draggable(
      data: 1,
      child: wordCard('أسد'),
      childWhenDragging: Container(),
      feedback: wordCard('أسد'),
    ),
    Draggable(
      data: 2,
      child: wordCard('تفاحة'),
      childWhenDragging: Container(),
      feedback: wordCard('تفاحة'),
    ),
    Draggable(
      data: 3,
      child: wordCard('علي'),
      childWhenDragging: Container(),
      feedback: wordCard('علي'),
    ),
    Draggable(
      data: 4,
      child: wordCard('طائرة'),
      childWhenDragging: Container(),
      feedback: wordCard('طائرة'),
    ),
    Draggable(
      data: 5,
      child: wordCard('محمد'),
      childWhenDragging: Container(),
      feedback: wordCard('محمد'),
    ),
    Draggable(
      data: 6,
      child: wordCard('زرافة'),
      childWhenDragging: Container(),
      feedback: wordCard('زرافة'),
    ),
    Draggable(
      data: 7,
      child: wordCard('طاولة'),
      childWhenDragging: Container(),
      feedback: wordCard('طاولة'),
    ),
    Draggable(
      data: 8,
      child: wordCard('ليلى'),
      childWhenDragging: Container(),
      feedback: wordCard('ليلى'),
    ),
    Draggable(
      data: 9,
      child: wordCard('جزرة'),
      childWhenDragging: Container(),
      feedback: wordCard('جزرة'),
    ),
    Draggable(
      data: 10,
      child: wordCard('حاسوب'),
      childWhenDragging: Container(),
      feedback: wordCard('حاسوب'),
    ),
  ];

  // This variable is used to display a scaffold depending on the user answer.
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey();

  /* This list is used to check for each DragTarget if its condition is closed,
  and therefore, doesn't contains any value. Or if it is not, which means its
  value is false, then that means a Draggable has been successful been dragged
  to the said DragTarget, which then, should opens it and gives to the empty
  grey DragTarget the values of the Draggable that has been dragged to it. */
  List<bool> closed = [
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
  ];

  // This list is for holding the words for the DragTarget.
  List<String> wordData = [
    'كتاب',
    'أسد',
    'تفاحة',
    'علي',
    'طائرة',
    'محمد',
    'زرافة',
    'طاولة',
    'ليلى',
    'جزرة',
    'حاسوب',
  ];

  // This list is the default name for each DragTarget, it's also used on reset.
  List<String> dragTargetTempWord = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];

  // This list is for changing the color of the DragTarget.
  List<Color> answerColor = [
    Colors.grey[300],
    Colors.grey[300],
    Colors.grey[300],
    Colors.grey[300],
    Colors.grey[300],
    Colors.grey[300],
    Colors.grey[300],
    Colors.grey[300],
    Colors.grey[300],
    Colors.grey[300],
    Colors.grey[300],
    Colors.grey[300],
    Colors.grey[300],
    Colors.grey[300],
    Colors.grey[300],
    Colors.grey[300],
  ];

  // These two will be used for determine the color answer of the DragTarget.
  Color correctAnswer = Colors.green;
  Color wrongAnswer = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFFFBF09),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'صنف الكلمات التالية',
          style: TextStyle(
            fontSize: 30.0,
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFFFFBF09),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Wrap(
            direction: Axis.horizontal,
            alignment: WrapAlignment.center,
            children: [
              wordBank[0],
              wordBank[1],
              wordBank[2],
              wordBank[3],
              wordBank[4],
              wordBank[5],
              wordBank[6],
              wordBank[7],
              wordBank[8],
              wordBank[9],
              wordBank[10],
            ],
          ),
          padding(
            30.0, // Vertical
            10.0, // Horizontal
            Table(
              textDirection: TextDirection.rtl,
              border: TableBorder.all(
                  color: Color(0xFFFF5F3D),
                  width: 2.0,
                  style: BorderStyle.solid),
              children: [
                TableRow(children: [
                  typeContainer('إنسان'),
                  typeContainer('حيوان'),
                ]),
                /* The TableRow for both labels and their containers, which
                are 'إنسان' and 'حيوان'. */
                TableRow(children: [
                  // The first container under the label 'إنسان'.
                  whiteContainer(
                    padding(
                      5.0,
                      20.0,
                      /* This table contains the two TableRows for the first
                        four DragTargets in the top-right containers of
                        the 'إنسان' label. */
                      Table(
                        textDirection: TextDirection.rtl,
                        border: TableBorder.all(
                            color: Colors.white,
                            width: 12.0,
                            style: BorderStyle.solid),
                        children: [
                          // This is the first TableRow of the label 'إنسان'.
                          // The first DragTarget in the top-right.
                          TableRow(children: [
                            greyContainer(
                              /* This DragTarget has the first values in the
                              lists related to DragTarget, for an example: in
                              its boolean value of closed we use closed[0] to
                              resemble the first DragTarget. */
                              DragTarget(
                                builder: (
                                  BuildContext context,
                                  List<dynamic> candidateData,
                                  List<dynamic> rejectedData,
                                ) {
                                  return closed[0]
                                      ? Container()
                                      : Container(
                                          color: answerColor[0],
                                          alignment: Alignment.center,
                                          margin: EdgeInsets.all(5.0),
                                          child: wordPadding(
                                              dragTargetTempWord[0]),
                                        );
                                },
                                onWillAccept: (data) {
                                  /* if the boolean closed is equal true, then
                                  that mean the DragTarget has not accepted any
                                  Draggable yet, and therefore could accept one.
                                  However, if it equals false, then that mean
                                  that it already contains a Draggable, and
                                  therefore, it should not accept any more. */
                                  return closed[0] ? true : false;
                                },
                                onAccept: (data) {
                                  setState(() {
                                    /* This if-else statement will determine
                                    if the Draggable is the correct or wrong
                                    answer, in this case, this container belongs
                                    to the 'إنسان', and therefore, it should
                                    only accept names, and we have three names
                                    with the data numbers of 3, 5 and 8, so if
                                    a 'إنسان' Draggable has been dragged here
                                    it should be given the correct color of
                                    green. Also, if any Draggable has been
                                    dragged to this target with data different
                                    than the mentioned above, then it is wrong,
                                    and therefore should be given the wrong
                                    color of red.*/
                                    if (data == 3 || data == 5 || data == 8) {
                                      answerColor[0] = correctAnswer;
                                    } else {
                                      answerColor[0] = wrongAnswer;
                                    }
                                    /* Make the Draggable empty so it can not
                                    be used again. */
                                    wordBank[data] = emptyDraggable();

                                    /* Change the word in the DragTarget to
                                    match the draggable. */
                                    dragTargetTempWord[0] = wordData[data];

                                    /* Change the state for both onWillAccept
                                    and the builder's return, now the bool is
                                    false the onWillAccept will no longer
                                    accept any new Draggable, and the builder's
                                    return will change from an empty container
                                    to a draggable with an empty name and grey
                                    color, which both should be changed depends
                                    on the user's Draggable, and therefore,
                                    answer. */
                                    closed[0] = false;
                                  });
                                },
                              ),
                            ),
                            // The second DragTarget in the top-left.
                            greyContainer(
                              DragTarget(
                                builder: (
                                  BuildContext context,
                                  List<dynamic> candidateData,
                                  List<dynamic> rejectedData,
                                ) {
                                  return closed[1]
                                      ? Container()
                                      : Container(
                                          color: answerColor[1],
                                          alignment: Alignment.center,
                                          margin: EdgeInsets.all(5.0),
                                          child: wordPadding(
                                              dragTargetTempWord[1]),
                                        );
                                },
                                onWillAccept: (data) {
                                  return closed[1] ? true : false;
                                },
                                onAccept: (data) {
                                  setState(() {
                                    if (data == 3 || data == 5 || data == 8) {
                                      answerColor[1] = correctAnswer;
                                    } else {
                                      answerColor[1] = wrongAnswer;
                                    }
                                    wordBank[data] = emptyDraggable();
                                    dragTargetTempWord[1] = wordData[data];
                                    closed[1] = false;
                                  });
                                },
                              ),
                            ),
                          ]),
                          /* The second TableRow below the first TableRow in
                          the label 'إنسان'. */
                          TableRow(children: [
                            // The third DragTarget in the bottom-right.
                            greyContainer(
                              DragTarget(
                                builder: (
                                  BuildContext context,
                                  List<dynamic> candidateData,
                                  List<dynamic> rejectedData,
                                ) {
                                  return closed[2]
                                      ? Container()
                                      : Container(
                                          color: answerColor[2],
                                          alignment: Alignment.center,
                                          margin: EdgeInsets.all(5.0),
                                          child: wordPadding(
                                              dragTargetTempWord[2]),
                                        );
                                },
                                onWillAccept: (data) {
                                  return closed[2] ? true : false;
                                },
                                onAccept: (data) {
                                  setState(() {
                                    if (data == 3 || data == 5 || data == 8) {
                                      answerColor[2] = correctAnswer;
                                    } else {
                                      answerColor[2] = wrongAnswer;
                                    }
                                    wordBank[data] = emptyDraggable();
                                    dragTargetTempWord[2] = wordData[data];
                                    closed[2] = false;
                                  });
                                },
                              ),
                            ),
                            // The fourth DragTarget in the bottom-left.
                            greyContainer(
                              DragTarget(
                                builder: (
                                  BuildContext context,
                                  List<dynamic> candidateData,
                                  List<dynamic> rejectedData,
                                ) {
                                  return closed[3]
                                      ? Container()
                                      : Container(
                                          color: answerColor[3],
                                          alignment: Alignment.center,
                                          margin: EdgeInsets.all(5.0),
                                          child: wordPadding(
                                              dragTargetTempWord[3]),
                                        );
                                },
                                onWillAccept: (data) {
                                  return closed[3] ? true : false;
                                },
                                onAccept: (data) {
                                  setState(() {
                                    if (data == 3 || data == 5 || data == 8) {
                                      answerColor[3] = correctAnswer;
                                    } else {
                                      answerColor[3] = wrongAnswer;
                                    }
                                    wordBank[data] = emptyDraggable();
                                    dragTargetTempWord[3] = wordData[data];
                                    closed[3] = false;
                                  });
                                },
                              ),
                            ),
                          ]),
                        ],
                      ),
                    ),
                  ),
                  // The second container under the label 'حيوان'.
                  whiteContainer(
                    padding(
                      5.0,
                      20.0,
                      Table(
                        /* This table contains the two TableRows for the second
                        four DragTargets in the top-left containers of
                        the 'حيوان' label. */
                        textDirection: TextDirection.rtl,
                        border: TableBorder.all(
                            color: Colors.white,
                            width: 12.0,
                            style: BorderStyle.solid),
                        children: [
                          // This is the first TableRow of the label 'حيوان'.
                          TableRow(children: [
                            // The first DragTarget in the top-right.
                            greyContainer(
                              DragTarget(
                                builder: (
                                  BuildContext context,
                                  List<dynamic> candidateData,
                                  List<dynamic> rejectedData,
                                ) {
                                  return closed[4]
                                      ? Container()
                                      : Container(
                                          color: answerColor[4],
                                          alignment: Alignment.center,
                                          margin: EdgeInsets.all(5.0),
                                          child: wordPadding(
                                              dragTargetTempWord[4]),
                                        );
                                },
                                onWillAccept: (data) {
                                  return closed[4] ? true : false;
                                },
                                onAccept: (data) {
                                  setState(() {
                                    if (data == 1 || data == 6) {
                                      answerColor[4] = correctAnswer;
                                    } else {
                                      answerColor[4] = wrongAnswer;
                                    }
                                    wordBank[data] = emptyDraggable();
                                    dragTargetTempWord[4] = wordData[data];
                                    closed[4] = false;
                                  });
                                },
                              ),
                            ),
                            // The second DragTarget in the top-left.
                            greyContainer(
                              DragTarget(
                                builder: (
                                  BuildContext context,
                                  List<dynamic> candidateData,
                                  List<dynamic> rejectedData,
                                ) {
                                  return closed[5]
                                      ? Container()
                                      : Container(
                                          color: answerColor[5],
                                          alignment: Alignment.center,
                                          margin: EdgeInsets.all(5.0),
                                          child: wordPadding(
                                              dragTargetTempWord[5]),
                                        );
                                },
                                onWillAccept: (data) {
                                  return closed[5] ? true : false;
                                },
                                onAccept: (data) {
                                  setState(() {
                                    if (data == 1 || data == 6) {
                                      answerColor[5] = correctAnswer;
                                    } else {
                                      answerColor[5] = wrongAnswer;
                                    }
                                    wordBank[data] = emptyDraggable();
                                    dragTargetTempWord[5] = wordData[data];
                                    closed[5] = false;
                                  });
                                },
                              ),
                            ),
                          ]),
                          /* The second TableRow below the first TableRow in
                          the label 'حيوان'. */
                          TableRow(children: [
                            // The third DragTarget in the bottom-right.
                            greyContainer(
                              DragTarget(
                                builder: (
                                  BuildContext context,
                                  List<dynamic> candidateData,
                                  List<dynamic> rejectedData,
                                ) {
                                  return closed[6]
                                      ? Container()
                                      : Container(
                                          color: answerColor[6],
                                          alignment: Alignment.center,
                                          margin: EdgeInsets.all(5.0),
                                          child: wordPadding(
                                              dragTargetTempWord[6]),
                                        );
                                },
                                onWillAccept: (data) {
                                  return closed[6] ? true : false;
                                },
                                onAccept: (data) {
                                  setState(() {
                                    if (data == 1 || data == 6) {
                                      answerColor[6] = correctAnswer;
                                    } else {
                                      answerColor[6] = wrongAnswer;
                                    }
                                    wordBank[data] = emptyDraggable();
                                    dragTargetTempWord[6] = wordData[data];
                                    closed[6] = false;
                                  });
                                },
                              ),
                            ),
                            // The fourth DragTarget in the bottom-left.
                            greyContainer(
                              DragTarget(
                                builder: (
                                  BuildContext context,
                                  List<dynamic> candidateData,
                                  List<dynamic> rejectedData,
                                ) {
                                  return closed[7]
                                      ? Container()
                                      : Container(
                                          color: answerColor[7],
                                          alignment: Alignment.center,
                                          margin: EdgeInsets.all(5.0),
                                          child: wordPadding(
                                              dragTargetTempWord[7]),
                                        );
                                },
                                onWillAccept: (data) {
                                  return closed[7] ? true : false;
                                },
                                onAccept: (data) {
                                  setState(() {
                                    if (data == 1 || data == 6) {
                                      answerColor[7] = correctAnswer;
                                    } else {
                                      answerColor[7] = wrongAnswer;
                                    }
                                    dragTargetTempWord[7] = wordData[data];
                                    wordBank[data] = emptyDraggable();
                                    closed[7] = false;
                                  });
                                },
                              ),
                            ),
                          ]),
                        ],
                      ),
                    ),
                  ),
                ]),
                TableRow(children: [
                  typeContainer('نبات'),
                  typeContainer('جماد'),
                ]),
                /* The TableRow for both labels and their containers, which
                are 'نبات' and 'جماد'. */
                TableRow(children: [
                  // The third container under the label 'نبات'.
                  whiteContainer(
                    padding(
                      5.0,
                      20.0,
                      Table(
                        /* This table contains the two TableRows for the third
                        four DragTargets in the bottom-right containers of
                        the 'نبات' label. */
                        textDirection: TextDirection.rtl,
                        border: TableBorder.all(
                            color: Colors.white,
                            width: 12.0,
                            style: BorderStyle.solid),
                        children: [
                          // This is the first TableRow of the label 'نبات'.
                          TableRow(children: [
                            // The first DragTarget in the top-right.
                            greyContainer(
                              DragTarget(
                                builder: (
                                  BuildContext context,
                                  List<dynamic> candidateData,
                                  List<dynamic> rejectedData,
                                ) {
                                  return closed[8]
                                      ? Container()
                                      : Container(
                                          color: answerColor[8],
                                          alignment: Alignment.center,
                                          margin: EdgeInsets.all(5.0),
                                          child: wordPadding(
                                              dragTargetTempWord[8]),
                                        );
                                },
                                onWillAccept: (data) {
                                  return closed[8] ? true : false;
                                },
                                onAccept: (data) {
                                  setState(() {
                                    if (data == 2 || data == 9) {
                                      answerColor[8] = correctAnswer;
                                    } else {
                                      answerColor[8] = wrongAnswer;
                                    }
                                    wordBank[data] = emptyDraggable();
                                    dragTargetTempWord[8] = wordData[data];
                                    closed[8] = false;
                                  });
                                },
                              ),
                            ),
                            // The second DragTarget in the top-left.
                            greyContainer(
                              DragTarget(
                                builder: (
                                  BuildContext context,
                                  List<dynamic> candidateData,
                                  List<dynamic> rejectedData,
                                ) {
                                  return closed[9]
                                      ? Container()
                                      : Container(
                                          color: answerColor[9],
                                          alignment: Alignment.center,
                                          margin: EdgeInsets.all(5.0),
                                          child: wordPadding(
                                              dragTargetTempWord[9]),
                                        );
                                },
                                onWillAccept: (data) {
                                  return closed[9] ? true : false;
                                },
                                onAccept: (data) {
                                  setState(() {
                                    if (data == 2 || data == 9) {
                                      answerColor[9] = correctAnswer;
                                    } else {
                                      answerColor[9] = wrongAnswer;
                                    }
                                    wordBank[data] = emptyDraggable();
                                    dragTargetTempWord[9] = wordData[data];
                                    closed[9] = false;
                                  });
                                },
                              ),
                            ),
                          ]),
                          /* The second TableRow below the first TableRow in
                          the label 'نبات'. */
                          TableRow(children: [
                            // The third DragTarget in the bottom-right.
                            greyContainer(
                              DragTarget(
                                builder: (
                                  BuildContext context,
                                  List<dynamic> candidateData,
                                  List<dynamic> rejectedData,
                                ) {
                                  return closed[10]
                                      ? Container()
                                      : Container(
                                          color: answerColor[10],
                                          alignment: Alignment.center,
                                          margin: EdgeInsets.all(5.0),
                                          child: wordPadding(
                                              dragTargetTempWord[10]),
                                        );
                                },
                                onWillAccept: (data) {
                                  return closed[10] ? true : false;
                                },
                                onAccept: (data) {
                                  setState(() {
                                    if (data == 2 || data == 9) {
                                      answerColor[10] = correctAnswer;
                                    } else {
                                      answerColor[10] = wrongAnswer;
                                    }
                                    wordBank[data] = emptyDraggable();
                                    dragTargetTempWord[10] = wordData[data];
                                    closed[10] = false;
                                  });
                                },
                              ),
                            ),
                            // The fourth DragTarget in the bottom-left.
                            greyContainer(
                              DragTarget(
                                builder: (
                                  BuildContext context,
                                  List<dynamic> candidateData,
                                  List<dynamic> rejectedData,
                                ) {
                                  return closed[11]
                                      ? Container()
                                      : Container(
                                          color: answerColor[11],
                                          alignment: Alignment.center,
                                          margin: EdgeInsets.all(5.0),
                                          child: wordPadding(
                                              dragTargetTempWord[11]),
                                        );
                                },
                                onWillAccept: (data) {
                                  return closed[11] ? true : false;
                                },
                                onAccept: (data) {
                                  setState(() {
                                    if (data == 2 || data == 9) {
                                      answerColor[11] = correctAnswer;
                                    } else {
                                      answerColor[11] = wrongAnswer;
                                    }
                                    dragTargetTempWord[11] = wordData[data];
                                    wordBank[data] = emptyDraggable();
                                    closed[11] = false;
                                  });
                                },
                              ),
                            ),
                          ]),
                        ],
                      ),
                    ),
                  ),
                  // The fourth and final container under the label 'جماد'.
                  whiteContainer(
                    padding(
                      5.0,
                      20.0,
                      Table(
                        /* This table contains the two TableRows for the fourth
                        and final four DragTargets in the bottom-left
                        containers of the 'جماد' label. */
                        textDirection: TextDirection.rtl,
                        border: TableBorder.all(
                            color: Colors.white,
                            width: 12.0,
                            style: BorderStyle.solid),
                        children: [
                          // This is the first TableRow of the label 'جماد'.
                          TableRow(children: [
                            // The first DragTarget in the top-right.
                            greyContainer(
                              DragTarget(
                                builder: (
                                  BuildContext context,
                                  List<dynamic> candidateData,
                                  List<dynamic> rejectedData,
                                ) {
                                  return closed[12]
                                      ? Container()
                                      : Container(
                                          color: answerColor[12],
                                          alignment: Alignment.center,
                                          margin: EdgeInsets.all(5.0),
                                          child: wordPadding(
                                              dragTargetTempWord[12]),
                                        );
                                },
                                onWillAccept: (data) {
                                  return closed[12] ? true : false;
                                },
                                onAccept: (data) {
                                  setState(() {
                                    if (data == 0 ||
                                        data == 4 ||
                                        data == 7 ||
                                        data == 10) {
                                      answerColor[12] = correctAnswer;
                                    } else {
                                      answerColor[12] = wrongAnswer;
                                    }
                                    wordBank[data] = emptyDraggable();
                                    dragTargetTempWord[12] = wordData[data];
                                    closed[12] = false;
                                  });
                                },
                              ),
                            ),
                            // The second DragTarget in the top-left.
                            greyContainer(
                              DragTarget(
                                builder: (
                                  BuildContext context,
                                  List<dynamic> candidateData,
                                  List<dynamic> rejectedData,
                                ) {
                                  return closed[13]
                                      ? Container()
                                      : Container(
                                          color: answerColor[13],
                                          alignment: Alignment.center,
                                          margin: EdgeInsets.all(5.0),
                                          child: wordPadding(
                                              dragTargetTempWord[13]),
                                        );
                                },
                                onWillAccept: (data) {
                                  return closed[13] ? true : false;
                                },
                                onAccept: (data) {
                                  setState(() {
                                    if (data == 0 ||
                                        data == 4 ||
                                        data == 7 ||
                                        data == 10) {
                                      answerColor[13] = correctAnswer;
                                    } else {
                                      answerColor[13] = wrongAnswer;
                                    }
                                    wordBank[data] = emptyDraggable();
                                    dragTargetTempWord[13] = wordData[data];
                                    closed[13] = false;
                                  });
                                },
                              ),
                            ),
                          ]),
                          /* The second TableRow below the first TableRow in
                          the label 'جماد'. */
                          TableRow(children: [
                            // The third DragTarget in the bottom-right.
                            greyContainer(
                              DragTarget(
                                builder: (
                                  BuildContext context,
                                  List<dynamic> candidateData,
                                  List<dynamic> rejectedData,
                                ) {
                                  return closed[14]
                                      ? Container()
                                      : Container(
                                          color: answerColor[14],
                                          alignment: Alignment.center,
                                          margin: EdgeInsets.all(5.0),
                                          child: wordPadding(
                                              dragTargetTempWord[14]),
                                        );
                                },
                                onWillAccept: (data) {
                                  return closed[14] ? true : false;
                                },
                                onAccept: (data) {
                                  setState(() {
                                    if (data == 0 ||
                                        data == 4 ||
                                        data == 7 ||
                                        data == 10) {
                                      answerColor[14] = correctAnswer;
                                    } else {
                                      answerColor[14] = wrongAnswer;
                                    }
                                    wordBank[data] = emptyDraggable();
                                    dragTargetTempWord[14] = wordData[data];
                                    closed[14] = false;
                                  });
                                },
                              ),
                            ),
                            // The fourth DragTarget in the bottom-left.
                            greyContainer(
                              DragTarget(
                                builder: (
                                  BuildContext context,
                                  List<dynamic> candidateData,
                                  List<dynamic> rejectedData,
                                ) {
                                  return closed[15]
                                      ? Container()
                                      : Container(
                                          color: answerColor[15],
                                          alignment: Alignment.center,
                                          margin: EdgeInsets.all(5.0),
                                          child: wordPadding(
                                              dragTargetTempWord[15]),
                                        );
                                },
                                onWillAccept: (data) {
                                  return closed[15] ? true : false;
                                },
                                onAccept: (data) {
                                  setState(() {
                                    if (data == 0 ||
                                        data == 4 ||
                                        data == 7 ||
                                        data == 10) {
                                      answerColor[15] = correctAnswer;
                                    } else {
                                      answerColor[15] = wrongAnswer;
                                    }
                                    dragTargetTempWord[15] = wordData[data];
                                    wordBank[data] = emptyDraggable();
                                    closed[15] = false;
                                  });
                                },
                              ),
                            ),
                          ]),
                        ],
                      ),
                    ),
                  ),
                ]),
              ],
            ),
          ),
        ],
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
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
