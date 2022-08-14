import 'package:flutter/material.dart';
import 'package:sliver/button.dart';
import 'package:sliver/sliver_fill.dart';
import 'package:sliver/sliver_one.dart';

class InitPage extends StatelessWidget {
  const InitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sliver Demo"),
      ),
      body: Center(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const <Widget>[
              Button(title: "Sliver One", route: SliverOne.routeName),
              Button(title: "Sliver Fill", route: SliverFill.routeName),
            ],
          ),
        ),
      ),
    );
  }
}
