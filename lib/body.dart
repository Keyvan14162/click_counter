import 'dart:math';

import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int _counter = 0;
  int _goal = 0;
  int _remain = 0;
  final double _myFontSize = 32;
  final double _myBorderRadius = 5;
  Color _randomColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return bodyContainer();
  }

  Container bodyContainer() {
    return Container(
      // this container, containers all screen
      color: _randomColor,
      child: Container(
        margin: EdgeInsets.all(8),
        child: Column(
          children: [
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 70,
                  height: 70,
                  child: FloatingActionButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(_myBorderRadius),
                      ),
                    ),
                    onPressed: () {
                      createRandomColor();
                      counterDecrease();
                      changeRemain();
                    },
                    child: Icon(
                      Icons.remove,
                      size: _myFontSize + 6,
                    ),
                  ),
                ),
                SizedBox(
                  width: 70,
                  height: 70,
                  child: FloatingActionButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(_myBorderRadius)),
                    onPressed: () {
                      createRandomColor();
                      counterIncrease();
                      counterIncrease();
                      changeRemain();
                    },
                    child: Text(
                      "++",
                      style: TextStyle(fontSize: _myFontSize - 2),
                    ),
                  ),
                ),
                SizedBox(
                  width: 120,
                  height: 70,
                  child: FloatingActionButton.extended(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    onPressed: () {
                      createRandomColor();
                      changeGoal();
                      counterReset();
                      changeRemain();
                    },
                    label: Text(
                      "Reset",
                      style: TextStyle(
                        fontSize: 40,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Goal : ${_goal}",
                  style: TextStyle(fontSize: _myFontSize, color: Colors.white),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _counter.toString(),
                  style: TextStyle(
                    fontSize: _myFontSize + 68,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Remain : ${_remain}",
                  style: TextStyle(fontSize: _myFontSize, color: Colors.white),
                ),
              ],
            ),
            Flexible(
              child: FractionallySizedBox(
                widthFactor: 1,
                heightFactor: 1,
                child: Container(
                  child: FloatingActionButton(
                    onPressed: () {
                      createRandomColor();
                      counterIncrease();
                      changeRemain();
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(_myBorderRadius + 5),
                    ),
                    child: Icon(
                      Icons.plus_one,
                      size: _myFontSize + 168,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void counterIncrease() {
    setState(() {});
    _counter++;
  }

  void counterDecrease() {
    setState(() {});
    _counter--;
  }

  void counterReset() {
    setState(() {});
    _counter = 0;
  }

  void changeGoal() {
    _goal = _counter;
    setState(() {});
  }

  void changeRemain() {
    _remain = _goal - _counter;
    setState(() {});
  }

  void createRandomColor() {
    _randomColor = Colors.primaries[Random().nextInt(Colors.primaries.length)];
  }

  Color get getRandomColor {
    return _randomColor;
  }
}
