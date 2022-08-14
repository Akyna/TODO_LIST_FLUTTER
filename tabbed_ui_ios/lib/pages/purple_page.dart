import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tabbed_ui_ios/top_bar.dart';

class PurplePage extends StatelessWidget {
  const PurplePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return CupertinoPageScaffold(
    //   child: Container(
    //     color: Colors.orange,
    //   ),
    // );
    return MyTopBar(
      text: "Purple Page",
      style: const TextStyle(fontSize: 16),
      child: Container(
        color: Colors.deepPurple,
      ),
    );
  }
}
