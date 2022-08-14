import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:timer_stream/cubit/my_timer_cubit.dart';
import 'package:timer_stream/widgets/widget.dart';

class CubitExample extends StatelessWidget {
  CubitExample({Key? key}) : super(key: key);

  static const String routeName = "/CubitExample";

  late final List<String> items = List<String>.generate(50, (i) => 'Cubit $i');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cubit"),
      ),
      body: SafeArea(
        child: ListView.custom(
          childrenDelegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return BlocProvider<MyTimerCubit>(
                create: (context) => MyTimerCubit(),
                child: CubitListTile(
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
