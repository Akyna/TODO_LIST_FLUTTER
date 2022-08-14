import 'package:flutter/material.dart';

class PreDefined extends StatefulWidget {
  const PreDefined({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  static const routeName = '/pre-defined';

  @override
  _PreDefinedState createState() => _PreDefinedState();
}

class _PreDefinedState extends State<PreDefined>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  double _scale = 1.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 1200), vsync: this)
      ..repeat();
  }

  void _handlePressScale() {
    setState(() {
      _scale = _scale == 1 ? 4 : 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ScaleTransition(
                scale: _controller,
                child: const Text('ScaleTransition',
                    style: TextStyle(fontSize: 20)),
              ),
              AnimatedScale(
                scale: _scale,
                curve: Curves.easeInOut,
                duration: const Duration(milliseconds: 1200),
                child:
                    const Text('AnimatedScale', style: TextStyle(fontSize: 20)),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _handlePressScale,
          tooltip: 'Press to scale',
          child: const Icon(Icons.format_size),
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
