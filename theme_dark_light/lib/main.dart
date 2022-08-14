import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
        /* light theme settings */
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        /* dark theme settings */
      ),
      highContrastTheme: ,
      themeMode: ThemeMode.system,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have',
              style: const TextStyle(fontSize: 20, color: Colors.black),
              textScaleFactor: mediaQueryData.textScaleFactor.clamp(1.0, 1.5),
            ),
            const Text(
              'You have',
              style: TextStyle(fontSize: 20, color: Colors.black),
              textScaleFactor: 1.0,
            ),
            Semantics(
              child: const Text(
                'Semantics is ON',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              label: "This is my very important button!",
              enabled: true,
              readOnly: true,
            ),
            Semantics(
              child: const Text(
                'Semantics is OFF',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              label: "This is my not very important button!",
              enabled: false,
              readOnly: true,
            ),
            if (mediaQueryData.accessibleNavigation)
              const Scaffold(
                body: Center(
                  child: Text(
                    'Screen reader is on',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
