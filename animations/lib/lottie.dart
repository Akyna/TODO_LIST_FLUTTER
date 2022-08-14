import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MyLottie extends StatefulWidget {
  const MyLottie({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  static const routeName = '/lottie';

  @override
  _MyLottieState createState() => _MyLottieState();
}

class _MyLottieState extends State<MyLottie>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this)
      ..value = 0.0
      ..addListener(() {
        setState(() {
          // Rebuild the widget at each frame to update the "progress" label.
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Lottie.network(
              'https://raw.githubusercontent.com/xvrh/lottie-flutter/master/example/assets/Mobilo/A.json',
              height: 200,
              frameRate: FrameRate.max,
            ),
          ),
          Lottie.asset(
            'assets/lottie2.json',
            controller: _controller,
            height: 200,
            onLoaded: (composition) {
              setState(() {
                _controller.duration = composition.duration;
              });
            },
          ),
          Text(_controller.value.toStringAsFixed(2)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Play backward
              IconButton(
                icon: const Icon(Icons.arrow_left),
                onPressed: () {
                  _controller.reverse();
                },
              ),
              // Pause
              IconButton(
                icon: const Icon(Icons.pause),
                onPressed: () {
                  _controller.stop();
                },
              ),
              // Play forward
              IconButton(
                icon: const Icon(Icons.arrow_right),
                onPressed: () {
                  _controller.forward();
                },
              ),
            ],
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              // Loop between 2 specifics frames

              var start = 0.0;
              var stop = 1.0;
              _controller.repeat(
                min: start,
                max: stop,
                reverse: true,
                period: _controller.duration! * (stop - start),
              );
            },
            child: const Text('Loop between frames'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
