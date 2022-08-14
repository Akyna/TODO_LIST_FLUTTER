import 'package:flutter/material.dart';
import 'package:tabbed_ui_appbar/pages/pages.dart';
import 'package:tabbed_ui_appbar/services/navigation_service.dart';

class NestedHomePage extends StatefulWidget {
  const NestedHomePage({Key? key}) : super(key: key);

  @override
  State<NestedHomePage> createState() => _NestedHomePageState();
}

class _NestedHomePageState extends State<NestedHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Center(
          child: TextButton(
              onPressed: () {
                NavigationService.nestedNavigation.currentState!.pushNamed(car);
              },
              child: const Text("GO NESTED")),
        ),
      ),
    );
  }
}
