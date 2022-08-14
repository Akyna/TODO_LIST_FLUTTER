import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tabbed_ui_ios_with_hero_tag/pages/pages.dart';
import 'package:tabbed_ui_ios_with_hero_tag/top_bar.dart';

class MyFirstTab extends StatelessWidget {
  const MyFirstTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyTopBar(
      text: "Tab 1",
      uniqueHeroTag: 'tab1',
      style: const TextStyle(fontSize: 16),
      child: Container(
        color: Colors.redAccent,
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  Platform.isIOS
                      ? CupertinoPageRoute(
                          builder: (context) => const PurplePage())
                      : MaterialPageRoute(
                          builder: (context) => const PurplePage()));
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
