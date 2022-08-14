import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:tabbed_ui_ios/main.dart';

class BlackPage extends StatelessWidget {
  const BlackPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text("Black Page"),
      ),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(child: Text("Black Page")),
            CupertinoButton(
              child: const Text("BACK TO THE FUTURE"),
              onPressed: ()  {
                // Navigator.of(context).pushAndRemoveUntil(
                //   CupertinoPageRoute(
                //     builder: (context) => const MyHomePage(title: "title"),
                //   ),
                //   (route) => false,
                // );
                // Navigator.of(context).popUntil((route) => route.isFirst);
                // sleep(const Duration(milliseconds: 500));
                //
                Navigator.of(context).pushAndRemoveUntil(
                  PageRouteBuilder(
                    pageBuilder: (context, animation1, animation2) =>
                    const MyHomePage(),
                    transitionDuration: const Duration(milliseconds: 50),
                    transitionsBuilder: (context, animation, secondaryAnimation,
                        child) {
                      const begin = 0.0;
                      const end = 1.0;
                      var tween = Tween(begin: begin, end: end);
                      final Animation<double> fadeInAnimation = animation.drive(
                          tween);
                      return FadeTransition(
                          opacity: fadeInAnimation, child: child);
                    },
                  ),
                      (_) => false, //3 is count of your pages you want to pop
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
