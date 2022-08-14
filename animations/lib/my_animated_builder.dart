import 'dart:math';

import 'package:flutter/material.dart';

class MyAnimatedBuilder extends StatefulWidget {
  const MyAnimatedBuilder({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  static const routeName = '/my-animated-builder';

  @override
  _MyAnimatedBuilderState createState() => _MyAnimatedBuilderState();
}

class _MyAnimatedBuilderState extends State<MyAnimatedBuilder>
    with TickerProviderStateMixin {
  /// ROTATE
  late final AnimationController _rotateController;
  late final Animation<double> _rotateAnimation;

  /// AUTO SLIDE
  late final AnimationController _slideController;
  Animation<double>? _slideAnimation;

  /// MANUAL SLIDE
  late final AnimationController _moveController;
  late Animation<double> _moveAnimation;
  late final CurvedAnimation _moveCurvedAnimation;

  /// MANUAL TRANSFORM
  late final AnimationController _transformController;
  late final CurvedAnimation _transformCurvedAnimation;
  late final Animation<double> _transformSizeAnimation;
  late final Animation<BorderRadius?> _transformBorderRadiusAnimation;

  // bool isDown = false;
  final _isDown = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();

    /// ROTATE
    _rotateController =
        AnimationController(duration: const Duration(seconds: 3), vsync: this)
          ..repeat();
    _rotateAnimation =
        Tween<double>(begin: 0, end: 2 * pi).animate(_rotateController);

    /// AUTO SLIDE
    _slideController =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    _slideAnimationProceed();

    /// MANUAL SLIDE
    _moveController =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    _moveCurvedAnimation =
        CurvedAnimation(parent: _moveController, curve: Curves.fastOutSlowIn);
    _moveAnimation =
        Tween<double>(begin: -1, end: 0).animate(_moveCurvedAnimation);

    /// MANUAL TRANSFORM
    _transformController =
        AnimationController(duration: const Duration(seconds: 4), vsync: this)
          ..repeat();
    _transformCurvedAnimation =
        CurvedAnimation(parent: _transformController, curve: Curves.ease);
    _transformSizeAnimation =
        Tween<double>(begin: 50, end: 400).animate(_transformCurvedAnimation);
    _transformBorderRadiusAnimation = BorderRadiusTween(
      begin: BorderRadius.circular(60),
      end: BorderRadius.circular(16),
    ).animate(_transformCurvedAnimation);
  }

  void _slideAnimationProceed() {
    final isFirst = _slideAnimation == null || _slideAnimation?.value == 1.0;
    final _curvedAnimation =
        CurvedAnimation(parent: _slideController, curve: Curves.fastOutSlowIn);

    if (isFirst) {
      _slideAnimation = Tween<double>(begin: -1, end: 0)
          .animate(_curvedAnimation)
        ..addStatusListener(_statusListener);
    } else {
      _slideAnimation = Tween<double>(begin: 0, end: 1)
          .animate(_curvedAnimation)
        ..addStatusListener(_statusListener);
    }
    _slideController.reset();
    _slideController.forward();
  }

  void _forwardMoveAnimation() {
    _moveAnimation =
        Tween<double>(begin: 0, end: 1).animate(_moveCurvedAnimation);
  }

  void _resetMoveAnimation() {
    _moveAnimation =
        Tween<double>(begin: -1, end: 0).animate(_moveCurvedAnimation);
  }

  void _statusListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      _slideAnimation?.removeStatusListener(_statusListener);
      _slideAnimationProceed();
    }
  }

  @override
  Widget build(BuildContext context) {
    const _divider = Divider(
      thickness: 1.5,
      indent: 20,
      endIndent: 20,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ClipRect(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// AUTO SLIDE
            Center(
              child: AnimatedBuilder(
                child: Container(
                  color: Colors.orange,
                  width: 100,
                  height: 100,
                ),
                builder: (context, child) {
                  final width = MediaQuery.of(context).size.width;
                  final x = _slideAnimation!.value * width;
                  return Transform(
                    transform: Matrix4.translationValues(x, 0, 0),
                    child: child,
                  );
                },
                animation: _slideAnimation!,
              ),
            ),
            _divider,

            /// MANUAL SLIDE
            Center(
              child: AnimatedBuilder(
                child: Container(
                  color: Colors.indigo,
                  width: 150,
                  height: 150,
                ),
                builder: (context, child) {
                  final width = MediaQuery.of(context).size.width;
                  final x = _moveAnimation.value * width;
                  return Transform(
                    transform: Matrix4.translationValues(x, 0, 0),
                    child: child,
                  );
                },
                animation: _moveAnimation,
              ),
            ),
            _divider,

            /// ROTATE
            Center(
              child: AnimatedBuilder(
                child: ConstrainedBox(
                  constraints: const BoxConstraints.tightForFinite(
                    width: 100,
                    height: 100,
                  ),
                  child: const FlutterLogo(),
                ),
                builder: (context, child) => Transform.rotate(
                  angle: _rotateAnimation.value,
                  child: child,
                ),
                animation: _rotateAnimation,
              ),
            ),
            _divider,

            /// MANUAL TRANSFORM
            Center(
              child: AnimatedBuilder(
                builder: (context, child) {
                  return ConstrainedBox(
                    constraints:
                        const BoxConstraints.tightForFinite(height: 200),
                    child: Center(
                      child: Container(
                        width: _transformSizeAnimation.value,
                        height: _transformSizeAnimation.value,
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: _transformBorderRadiusAnimation.value,
                        ),
                      ),
                    ),
                  );
                },
                animation: _transformController,
              ),
            ),
            _divider,

            /// BUTTONS
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (_moveAnimation.value == 0) {
                          _forwardMoveAnimation();
                        } else if (_moveAnimation.value == 1) {
                          _resetMoveAnimation();
                        }
                        _moveController.reset();
                        _moveController.forward();
                      },
                      style: ElevatedButton.styleFrom(
                        splashFactory: NoSplash.splashFactory,
                      ),
                      child: const Text(
                        "Manual slide",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTapDown: (_) => _isDown.value = true,
                      onTapUp: (_) => _isDown.value = false,
                      onTapCancel: () => _isDown.value = false,
                      onTap: () {
                        ScaffoldMessenger.of(context).clearSnackBars();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("In future"),
                          ),
                        );
                      },
                      child: ValueListenableBuilder<bool>(
                        valueListenable: _isDown,
                        builder: (context, value, child) {
                          return AnimatedOpacity(
                            child: child,
                            duration: const Duration(milliseconds: 50),
                            opacity: value ? 0.5 : 1,
                          );
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: Colors.indigo,
                          ),
                          height: 37,
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 14),
                            child: Center(
                              child: Text(
                                "Manual transform",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _slideController.dispose();
    _rotateController.dispose();
    _moveController.dispose();
    _transformController.dispose();
    _isDown.dispose();
    super.dispose();
  }
}
