import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:my_provider/models/models.dart';

class MyProxyProviderPage extends StatelessWidget {
  const MyProxyProviderPage({Key? key}) : super(key: key);

  static String routeName = "/my-proxy-provider-page";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProxyProvider example'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Consumer<Counter>(
              builder: (_, counter, __) {
                return Text(
                  '${counter.count}',
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
            /// Так делать не нужно!!!
            Text(context.watch<Translations>().title),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<Counter>().increment(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
