import 'package:flutter/material.dart';
import 'package:my_navigation/pages/pages.dart';

class ScreenA extends StatelessWidget {
  const ScreenA({Key? key}) : super(key: key);

  static const routeName = '/return-screen-a';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Returning Data Demo'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            // Navigator.push returns a Future that completes after calling
            // Navigator.pop on the Selection Screen.
            final result = await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ScreenB()),
            );

            // After the Selection Screen returns a result, hide any previous snackbars
            // and show the new result.
            ScaffoldMessenger.of(context)
              ..removeCurrentSnackBar()
              ..showSnackBar(SnackBar(content: Text('$result')));
          },
          child: const Text('Pick an option, any option!'),
        ),
      ),
    );
  }
}
