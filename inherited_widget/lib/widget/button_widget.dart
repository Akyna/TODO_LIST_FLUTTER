import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({
    required this.text,
    required this.onClicked,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialButton(
        child: Text(
          text,
          style: const TextStyle(fontSize: 20),
        ),
        onPressed: onClicked,
        color: Theme.of(context).primaryColor,
        textColor: Colors.black,
        shape: const StadiumBorder(),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      );
}
