import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:my_provider/models/models.dart';

class MySelectorPage extends StatelessWidget {
  const MySelectorPage({Key? key}) : super(key: key);

  static String routeName = "/my-selector-page";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Selector example'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Count:'),
            Selector<Counter, int>(
              selector: (_, counter) => counter.count,
              builder: (_, value, __) {
                return Text(
                  '$value',
                  key: const Key('SelectorCounterState'),
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
            const Text('Nested count:'),
            Selector<Counter, int>(
              selector: (_, counter) => counter.nestedCount,
              builder: (_, value, __) {
                return Text(
                  '$value',
                  key: const Key('SelectorCounterState'),
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => context.read<Counter>().increment(),
                  child: const Text("Increment count"),
                ),
                ElevatedButton(
                  onPressed: () => context.read<Counter>().incrementNested(),
                  child: const Text("Increment nested  count"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
