import 'package:flutter/material.dart';
import 'package:my_navigation/classes/classes.dart';

class SendScreenB extends StatelessWidget {
  // In the constructor, require a Todo.
  const SendScreenB({
    Key? key,
    required this.todo,
  }) : super(key: key);

  // Declare a field that holds the Todo.
  final Todo todo;

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
      appBar: AppBar(
        title: Text(todo.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(todo.description),
      ),
    );
  }
}
