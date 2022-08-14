import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tabbed_ui_ios_with_hero_tag/pages/pages.dart';
import 'package:tabbed_ui_ios_with_hero_tag/top_bar.dart';


class MySecondTab extends StatelessWidget {
  const MySecondTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyTopBar(
      text: "Tab 2",
      uniqueHeroTag: 'tab2',
      style: const TextStyle(fontSize: 16),
      child: Container(
        color: Colors.greenAccent,
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  Platform.isIOS
                      ? CupertinoPageRoute(
                          builder: (context) => const BlackPage(),
                        )
                      : MaterialPageRoute(
                          builder: (context) => const BlackPage(),
                        ));
            },
            child: const Text(
              'Go to test page',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
