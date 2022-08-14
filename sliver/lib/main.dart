import 'package:flutter/material.dart';
import 'package:sliver/init.dart';
import 'package:sliver/sliver_fill.dart';
import 'package:sliver/sliver_one.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sliver Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const InitPage(),
      routes: {
        SliverOne.routeName: (context) => const SliverOne(
          title: "SliverPersistentHeader",
        ),
        SliverFill.routeName: (context) => const SliverFill(
          title: "SliverFillRemaining",
        ),
      },
    );
  }
}
