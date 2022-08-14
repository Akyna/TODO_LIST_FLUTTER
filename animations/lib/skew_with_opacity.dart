import 'package:flutter/material.dart';

import 'package:vector_math/vector_math.dart' as vmath;

final _perspectiveTween = Tween<double>(
  begin: vmath.radians(90),
  end: vmath.radians(0),
);

class SkewWithOpacity extends StatefulWidget {
  const SkewWithOpacity({Key? key, required this.title}) : super(key: key);

  final String title;

  static const routeName = '/skew-with-opacity';

  @override
  State<SkewWithOpacity> createState() => _SkewWithOpacityState();
}

class _SkewWithOpacityState extends State<SkewWithOpacity> with SingleTickerProviderStateMixin {
  bool _isCollapsed = false;
  late final AnimationController _animationController;
  late final Animation<double> _animation;
  static const _duration = Duration(milliseconds: 600);

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: _duration);
    _animation = _animationController.drive(_perspectiveTween);
  }
  // vmath.radians(70)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                _animationController.value == 0 ? _animationController.forward(): _animationController.reverse();
                _isCollapsed = !_isCollapsed;
              });
            },
            icon: const Icon(Icons.message),
          ),
        ],
      ),
      body: Container(
        color: Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: ClipRect(
            child: AnimatedSlide(
              offset: _isCollapsed ? Offset.zero : const Offset(0, 1),
              duration: _duration,
              child: AnimatedBuilder(
                animation: _animation,
                child: const Text(
                  'Apartment for rent! JVjhv saas dhjvas hjvas fa sdgf asdasdjvasdjhavsdhjvasdhjv ',
                  style:
                      TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                ),
                builder: (context, child) {
                  return Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateX(_animation.value),
                    child: child,
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
