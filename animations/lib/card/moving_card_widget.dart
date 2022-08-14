import 'dart:math';
import 'package:flutter/material.dart';

class MovingCardWidget extends StatefulWidget {
  final String urlFront;
  final String urlBack;

  const MovingCardWidget({
    required this.urlFront,
    required this.urlBack,
    Key? key,
  }) : super(key: key);

  @override
  _MovingCardWidgetState createState() => _MovingCardWidgetState();
}

class _MovingCardWidgetState extends State<MovingCardWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late Animation<double> _animation;

  final isFront = ValueNotifier<bool>(true);
  final verticalDrag = ValueNotifier<double>(0.0);
  late final Image _cardFront;
  late final Image _cardBack;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _cardFront = Image.asset(widget.urlFront);
    _cardBack = Image.asset(widget.urlBack);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(_cardFront.image, context);
    precacheImage(_cardBack.image, context);
  }

  void _handleOnVerticalDragUpdate(details) {
    verticalDrag.value += details.delta.dy;
    verticalDrag.value %= 360;
    setImageSide();
  }

  void _handleOnVerticalDragEnd(details) {
    final end = 360 - verticalDrag.value >= 180 ? 0.0 : 360.0;

    _animation =
        Tween<double>(begin: verticalDrag.value, end: end).animate(_controller)
          ..addListener(() {
            verticalDrag.value = _animation.value;
            setImageSide();
          });
    _controller.forward();
  }

  void _handleOnVerticalDragStart(details) {
    _controller.reset();
    isFront.value = true;
    verticalDrag.value = 0;
  }

  void setImageSide() {
    if (verticalDrag.value <= 90 || verticalDrag.value >= 270) {
      isFront.value = true;
    } else {
      isFront.value = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragStart: _handleOnVerticalDragStart,
      onVerticalDragUpdate: _handleOnVerticalDragUpdate,
      onVerticalDragEnd: _handleOnVerticalDragEnd,
      child: ValueListenableBuilder<double>(
        valueListenable: verticalDrag,
        builder: (_, value, child) {
          return Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateX(value / 180 * pi),
            alignment: Alignment.center,
            child: child!,
          );
        },
        child: ValueListenableBuilder<bool>(
          valueListenable: isFront,
          builder: (_, value, child) {
            print("value: $value");
            return value
                ? child!
                : Transform(
                    transform: Matrix4.identity(),
                    alignment: Alignment.center,
                    child: _cardFront,
                  );
          },
          child: _cardFront,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    isFront.dispose();
    verticalDrag.dispose();
    super.dispose();
  }
}
