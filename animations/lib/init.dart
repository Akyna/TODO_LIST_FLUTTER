import 'package:flutter/material.dart';

import 'package:animations/button.dart';
import 'package:animations/lottie.dart';
import 'package:animations/my_animated_builder.dart';
import 'package:animations/my_animated_widget.dart';
import 'package:animations/pre-defined.dart';
import 'package:animations/staggered_animation.dart';
import 'package:animations/transformation.dart';
import 'package:animations/skew_with_opacity.dart';
import 'package:animations/skew_with_opacity_with_align.dart';

class InitPage extends StatelessWidget {
  const InitPage({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animation"),
      ),
      body: Center(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const <Widget>[
              Button(
                title: "Pre defined",
                route: PreDefined.routeName,
              ),
              Button(
                title: "AnimatedBuilder",
                route: MyAnimatedBuilder.routeName,
              ),
              Button(
                title: "AnimatedWidget",
                route: MyAnimatedWidget.routeName,
              ),
              Button(
                title: "Transformation",
                route: Transformation.routeName,
              ),
              Button(
                title: "Stagger Animation",
                route: StaggerDemo.routeName,
              ),
              Button(
                title: "Lottie",
                route: MyLottie.routeName,
              ),
              Button(
                title: "Skew with Opacity",
                route: SkewWithOpacity.routeName,
              ),
              Button(
                title: "Skew with Opacity and Align",
                route: SkewWithOpacityWithAlign.routeName,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
