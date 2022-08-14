import 'package:flutter/material.dart';

class DirectionsCar extends StatelessWidget {
  const DirectionsCar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text("BACK"),
        ),
      ),
    );
  }
}
