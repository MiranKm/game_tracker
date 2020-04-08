import 'dart:math';

import 'package:flutter/material.dart';

class TweenAnimationTest extends StatefulWidget {
  final Widget child;
  final Function function;

  TweenAnimationTest({this.child,this.function});

  @override
  _TweenAnimationTestState createState() => _TweenAnimationTestState();
}

class _TweenAnimationTestState extends State<TweenAnimationTest> {
  @override
  Widget build(BuildContext context) {

    return AnimatedBuilder(animation: null, builder: (BuildContext context, Widget child) {
      return child;
    },
    child: Container(),);
  }
}
