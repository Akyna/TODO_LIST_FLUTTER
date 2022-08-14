import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:my_provider/models/models.dart';

class MyConsumerPage extends StatelessWidget {
  const MyConsumerPage({Key? key}) : super(key: key);

  static String routeName = "/my-consumer-page";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consumer example'),
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
                  key: const Key('ConsumerCounterState'),
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        key: const Key('consumer_increment_floatingActionButton'),
        onPressed: () => context.read<Counter>().increment(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
