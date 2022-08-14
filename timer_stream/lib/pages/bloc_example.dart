import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer_stream/bloc/my_timer_bloc.dart';
import 'package:timer_stream/widgets/bloc_list_tile.dart';

class BlocExample extends StatelessWidget {
  BlocExample({Key? key}) : super(key: key);
  static const String routeName = "/BlocExample";

  late final List<String> items = List<String>.generate(50, (i) => 'Cubit $i');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bloc"),
      ),
      body: SafeArea(
        child: ListView.custom(
          childrenDelegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return BlocProvider<MyTimerBloc>(
                create: (context) => MyTimerBloc(),
                child: BlocListTile(
                  key: ValueKey<String>(items[index]),
                  title: items[index],
                ),
              );
            },
            childCount: items.length,
            findChildIndexCallback: (Key key) {
              final ValueKey<String> valueKey = key as ValueKey<String>;
              final String data = valueKey.value;
              return items.indexOf(data);
            },
          ),
        ),
      ),
    );
  }
}
