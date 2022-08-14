
import 'package:animations/lottie.dart';
import 'package:flutter/material.dart';

import 'package:animations/init.dart';
import 'package:animations/transformation.dart';
import 'package:animations/staggered_animation.dart';
import 'package:animations/my_animated_builder.dart';
import 'package:animations/my_animated_widget.dart';
import 'package:animations/pre-defined.dart';
import 'package:animations/skew_with_opacity.dart';
import 'package:animations/skew_with_opacity_with_align.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animation Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      routes: {
        InitPage.routeName: (context) => const InitPage(),
        PreDefined.routeName: (context) =>
            const PreDefined(title: "Pre defined animation"),
        MyAnimatedBuilder.routeName: (context) =>
            const MyAnimatedBuilder(title: "Animated Builder"),
        MyAnimatedWidget.routeName: (context) =>
            const MyAnimatedWidget(title: "Animated Widget"),
        Transformation.routeName: (context) =>
            const Transformation(title: "Transformation"),
        StaggerDemo.routeName: (context) =>
            const StaggerDemo(title: "Stagger Demo"),
        MyLottie.routeName: (context) => const MyLottie(title: "Lottie"),
        SkewWithOpacity.routeName: (context) => const SkewWithOpacity(title: "Skew with Opacity"),
        SkewWithOpacityWithAlign.routeName: (context) => const SkewWithOpacityWithAlign(title: "Skew with Opacity and Align"),
      },
    );
  }
}
