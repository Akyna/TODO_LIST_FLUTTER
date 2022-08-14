import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

import 'package:tabbed_ui_ios/services/navigation_service.dart';
import 'package:tabbed_ui_ios/tabs/tabs.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'Tabbed UI IOS',
      localizationsDelegates: <LocalizationsDelegate<dynamic>>[
        DefaultMaterialLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
      ],
      home: MyHomePage(title: 'Flutter Demo IOS tabbed'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
          ),
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return CupertinoTabView(
              navigatorKey: NavigationService.firstTabNavKey,
              builder: (BuildContext context) => const MyFirstTab(),
            );
          case 1:
            return CupertinoTabView(
              navigatorKey: NavigationService.secondTabNavKey,
              builder: (BuildContext context) => const MySecondTab(),
            );
          case 2:
            return CupertinoTabView(
              navigatorKey: NavigationService.thirdTabNavKey,
              builder: (BuildContext context) => const MyThirdTab(),
            );
          default:
            throw Exception("Only the pages above must be presented!");
        }
      },
    );
  }
}
