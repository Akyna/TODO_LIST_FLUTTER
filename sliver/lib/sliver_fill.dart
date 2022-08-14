import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:sliver/button.dart';

class SliverFill extends StatelessWidget {
  const SliverFill({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;
  static const routeName = '/sliver-fill';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: <Widget>[
        SliverAppBar(
          forceElevated: true,
          pinned: true,
          floating: true,
          expandedHeight: 200,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(title),
            background: Image.network(
              'https://picsum.photos/200',
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: Center(child: Text("SliverToBoxAdapter")),
        ),
        const SliverFillRemaining(
          child: Center(child: Text("SliverFillRemaining")),
        ),
      ]),
    );
  }
}
