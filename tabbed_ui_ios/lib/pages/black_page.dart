import 'package:flutter/material.dart';
import 'package:tabbed_ui_ios/top_bar.dart';

class BlackPage extends StatelessWidget {
  const BlackPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyTopBar(
      text: "Black Page",
      style: const TextStyle(fontSize: 16),
      child: Container(
        color: Colors.black,
      ),
    );
  }
}
