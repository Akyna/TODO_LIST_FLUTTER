import 'package:flutter/material.dart';
import 'package:my_navigation/classes/classes.dart';
import 'package:my_navigation/pages/pages.dart';

class SendScreenA extends StatelessWidget {
  // Requiring the list of todos.
  const SendScreenA({
    Key? key,
    required this.todos,
  }) : super(key: key);
  static const routeName = '/send-screen-a';

  final List<Todo> todos;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos'),
      ),
      //passing in the ListView.builder
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(todos[index].title),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SendScreenB(todo: todos[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
