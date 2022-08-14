import 'package:flutter/material.dart';
import 'package:tabbed_ui/services/navigation_service.dart';
import 'package:tabbed_ui/pages/pages.dart';

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
      body: Center(
        child: TextButton(
          onPressed: () {
            NavigationService.nestedNavigation.currentState!.pushNamed(car);
          },
          child: const Text("GO NESTED"),
        ),
      ),
    );
  }
}
