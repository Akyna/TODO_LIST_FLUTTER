import 'package:flutter/material.dart';
import 'package:my_provider/models/another_counter.dart';
import 'package:provider/provider.dart';

import 'package:my_provider/models/models.dart';
import 'package:my_provider/pages/pages.dart';


void main() {
  runApp(
    /// Providers are above [MyApp] instead of inside it, so that tests
    /// can use [MyApp] while mocking the providers
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Counter()),
        ProxyProvider<Counter, Translations>(
          update: (_, counter, __) => Translations(counter.count),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: const MainPage(),
      routes: {
        MySeparatePage.routeName: (context) => const MySeparatePage(),
        MyConsumerPage.routeName: (context) => const MyConsumerPage(),
        MySelectorPage.routeName: (context) => const MySelectorPage(),
        MyProxyProviderPage.routeName: (context) => const MyProxyProviderPage(),
      },
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed(MySeparatePage.routeName),
              child: const Text("Separate Widget"),
            ),
            ElevatedButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed(MyConsumerPage.routeName),
              child: const Text("Consumer Widget"),
            ),
            ElevatedButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed(MySelectorPage.routeName),
              child: const Text("Selector Widget"),
            ),
            ElevatedButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed(MyProxyProviderPage.routeName),
              child: const Text("ProxyProvider Widget"),
            ),
          ],
        ),
      ),
    );
  }
}
