import 'package:flutter/material.dart';

import 'package:animations/card/animated_card_widget.dart';
import 'package:animations/card/moving_card_widget.dart';

class Transformation extends StatefulWidget {
  const Transformation({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  static const routeName = '/transformation';

  @override
  _TransformationState createState() => _TransformationState();
}

class _TransformationState extends State<Transformation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: const [
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text("Simply pull down/up and drop the card"),
            ),
            MovingCardWidget(
              urlFront: 'assets/1_front.png',
              urlBack: 'assets/1_back.png',
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text("Simply press 'transform' button"),
            ),
            AnimatedCardWidget(),
          ],
        ),
      ),
    );
  }
}
