import 'package:flutter/cupertino.dart';
import 'package:tabbed_ui_ios/pages/pages.dart';

class PurplePage extends StatelessWidget {
  const PurplePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return CupertinoPageScaffold(
    //   child: Container(
    //     color: Colors.orange,
    //   ),
    // );
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text("Purple Page"),
      ),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(child: Text("Purple Page")),
            CupertinoButton(
              child: const Text("GO"),
              onPressed: () {
                Navigator.of(context).push(
                  CupertinoPageRoute(
                    builder: (context) => const BlackPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
