import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimatedCardWidget extends StatefulWidget {
  const AnimatedCardWidget({Key? key}) : super(key: key);

  @override
  _AnimatedCardWidgetState createState() => _AnimatedCardWidgetState();
}

class _AnimatedCardWidgetState extends State<AnimatedCardWidget>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnimation;
  late final Animation<double> _rotateAnimation;
  late final Animation<double> _bouncingAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 2500),
      vsync: this,
    );

    _scaleAnimation = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: Tween(begin: 1.0, end: 0.55),
          weight: 60.0,
        ),
        TweenSequenceItem<double>(
          tween: Tween(begin: 0.55, end: 1.0),
          weight: 40.0,
        ),
      ],
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
    _rotateAnimation = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: Tween(begin: 0, end: 0.1),
          weight: 1,
        ),
        TweenSequenceItem<double>(
          tween: Tween(begin: 0.1, end: 0),
          weight: 1,
        ),
      ],
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
    _bouncingAnimation = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: Tween(begin: 1.0, end: 0.5)
              .chain(CurveTween(curve: Curves.elasticOut)),
          weight: 50,
        ),
        TweenSequenceItem<double>(
          tween: Tween(begin: .5, end: 1.0)
              .chain(CurveTween(curve: Curves.elasticIn)),
          weight: 50,
        ),
      ],
    ).animate(_controller);
  }

  void _handleTransformCard() {
    _controller.reset();
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: RotationTransition(
              turns: _rotateAnimation,
              child: ScaleTransition(
                scale: _bouncingAnimation,
                child: Image.asset('assets/2_front.png', fit: BoxFit.cover),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: CupertinoButton(
            color: Colors.indigoAccent,
            child: const Text('Transform'),
            onPressed: _handleTransformCard,
          ),
        )
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
