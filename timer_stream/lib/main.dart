import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timer_stream/pages/pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainPage(title: 'Flutter Timer Demo'),
      routes: {
        StreamExample.routeName: (context) => const StreamExample(),
        BlocExample.routeName: (context) => BlocExample(),
        CubitExample.routeName: (context) => CubitExample(),
      },
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: CupertinoButton.filled(
                child: const Text("Stream"),
                onPressed: () =>
                    Navigator.of(context).pushNamed(StreamExample.routeName),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: CupertinoButton.filled(
                child: const Text("Bloc"),
                onPressed: () =>
                    Navigator.of(context).pushNamed(BlocExample.routeName),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: CupertinoButton.filled(
                child: const Text("Cubit"),
                onPressed: () =>
                    Navigator.of(context).pushNamed(CubitExample.routeName),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
