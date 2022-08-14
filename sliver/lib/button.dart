import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    Key? key,
    required this.title,
    required this.route,
  }) : super(key: key);

  final String title;
  final String route;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Colors.indigo, elevation: 0),
        onPressed: () {
          Navigator.pushNamed(context, route);
        },
        child: SizedBox(
          height: 80,
          child: Center(
            child: Text(title),
          ),
        ),
      ),
    );
  }
}
