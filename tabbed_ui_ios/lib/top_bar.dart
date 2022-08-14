import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTopBar extends StatelessWidget {
  const MyTopBar({
    Key? key,
    required this.text,
    required this.style,
    required this.child,
  }) : super(key: key);

  final String text;
  final TextStyle style;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (!Platform.isIOS) {
      return Scaffold(
        appBar: AppBar(
          title: Text(text, style: style),
        ),
        body: child,
      );
    }
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(text, style: style),
      ),
      child: child,
    );
  }
}
