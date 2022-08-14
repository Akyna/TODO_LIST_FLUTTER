import 'dart:math';
import 'dart:developer' as dev;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: darkBlue,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: MyWidget(),
      ),
    );
  }
}

class MyWidget extends StatefulWidget {
  @override
  State createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  double _top = 150;
  double _left = 50;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          left: _left,
          top: _top,
          // bottom: _bottom,
          // right: _right,
          child: GestureDetector(
            onTap: () => print('I was tapped!'),
            onPanUpdate: (details) {
              setState(() {
                _top = max(10, _top + details.delta.dy);
                _left = max(10, _left + details.delta.dx);
              });
            },
            child: Container(
              height: 100,
              width: 100,
              color: Colors.red,
            ),
          ),
        ),
      ],
    );
  }
}
