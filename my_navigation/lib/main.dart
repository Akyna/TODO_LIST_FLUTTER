import 'package:flutter/material.dart';

import 'package:my_navigation/classes/classes.dart';
import 'package:my_navigation/pages/pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Navigation Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
      routes: {
        ExtractArgumentsScreen.routeName: (context) =>
            const ExtractArgumentsScreen(),
        ScreenA.routeName: (context) => const ScreenA(),
        SendScreenA.routeName: (context) => SendScreenA(
                todos: List.generate(
              20,
              (i) => Todo(
                'Todo $i',
                'A description of what needs to be done for Todo $i',
              ),
            )),
      },
      onGenerateRoute: (settings) {
        if (settings.name == PageA.routeName) {
          return MaterialPageRoute(
            builder: (context) {
              return const PageA();
            },
          );
        }
        if (settings.name == PassArgumentsScreen.routeName) {
          final args = settings.arguments as ScreenArguments;
          return MaterialPageRoute(
            builder: (context) {
              return PassArgumentsScreen(
                title: args.title,
                message: args.message,
              );
            },
          );
        }
        assert(false, 'Need to implement ${settings.name}');
        return null;
      },
    );
  }
}
