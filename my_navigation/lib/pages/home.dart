import 'package:flutter/material.dart';
import 'package:my_navigation/classes/classes.dart';
import 'package:my_navigation/pages/pages.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Navigation"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // HERO
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, PageA.routeName);
              },
              child: const Text("Hero"),
            ),
            // PASS ARGUMENTS
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  PassArgumentsScreen.routeName,
                  arguments: ScreenArguments(
                    'Accept Arguments Screen',
                    'This message is extracted in the onGenerateRoute '
                        'function.',
                  ),
                );
              },
              child: const Text("Pass arguments"),
            ),
            // EXTRACT ARGUMENTS
            ElevatedButton(
              onPressed: () {
                // When the user taps the button,
                // navigate to a named route and
                // provide the arguments as an optional
                // parameter.
                Navigator.pushNamed(
                  context,
                  ExtractArgumentsScreen.routeName,
                  arguments: ScreenArguments(
                    'Extract Arguments Screen',
                    'This message is extracted in the build method.',
                  ),
                );
              },
              child: const Text('Extract ArgumentsScreen'),
            ),
            // RETURN DATA
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  ScreenA.routeName,
                );
              },
              child: const Text('Return data'),
            ),
            // SEND DATA
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  SendScreenA.routeName,
                );
              },
              child: const Text('Send data'),
            ),
          ],
        ),
      ),
    );
  }
}
