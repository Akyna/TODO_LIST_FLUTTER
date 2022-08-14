import 'dart:async';

import 'package:flutter/material.dart';

class MyListTile extends StatefulWidget {
  const MyListTile({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  State<MyListTile> createState() => _MyListTileState();
}

/// AutomaticKeepAliveClientMixin
/// for keeping state inside list

class _MyListTileState extends State<MyListTile>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  late final _streamController = StreamController<int>(
    onPause: () => print('Paused'),
    onResume: () => print('Resumed'),
    onCancel: () => print('Cancelled'),
    onListen: () => print('Listens'),
  );


  // late final _streamController = StreamController<int>(
  //   onPause: () => print('Paused'),
  //   onResume: () => print('Resumed'),
  //   onCancel: () => print('Cancelled'),
  //   onListen: () => print('Listens'),
  // );

  late final Stream<int> countStream;
  StreamSubscription<int>? _timerSubscription;

  bool _isStarted = false;

  late Stream<int> counterStream;
  late StreamSubscription<int> subscription;

  @override
  initState() {
    super.initState();

    // Stream<int>.periodic(const Duration(seconds: 1), (x) => x).take(15)

    countStream = _streamController.stream.asBroadcastStream();
    countStream.listen(
      (event) => print('Event: $event'),
      onDone: () => print('Done'),
      onError: (error) => print("Error: $error"),
    );



    counterStream = timedCounter(const Duration(seconds: 1), 15);

    subscription = counterStream.listen((int counter) {
      print(counter); // Print an integer every second.
      if (counter == 5) {
        // After 5 ticks, pause for five seconds, then resume.
        subscription.pause(Future.delayed(const Duration(seconds: 5)));
      }
    });
  }

  Stream<int> timedCounter(Duration interval, [int? maxCount]) {
    late StreamController<int> controller;
    Timer? timer;
    int counter = 0;

    void tick(_) {
      counter++;
      controller.add(counter); // Ask stream to send counter values as event.
      if (counter == maxCount) {
        timer?.cancel();
        controller.close(); // Ask stream to shut down and tell listeners.
      }
    }

    void startTimer() {
      timer = Timer.periodic(interval, tick);
    }

    void stopTimer() {
      timer?.cancel();
      timer = null;
    }

    controller = StreamController<int>(
        onListen: startTimer,
        onPause: stopTimer,
        onResume: startTimer,
        onCancel: stopTimer);

    return controller.stream;
  }

  Stream<int> count() async* {
    int i = 1;
    while (true) {
      await Future<void>.delayed(const Duration(seconds: 1));
      yield i++;
    }
  }

  // void _startTimer() async {
  //   int i = 1;
  //   while (true) {
  //     await Future<void>.delayed(const Duration(seconds: 1));
  //     _countController.add(i++);
  //   }
  // }

  void _startTimer() async {
    countStream = Stream<int>.periodic(const Duration(seconds: 1), (x) => x + 1)
        .take(150);
    setState(() {});
  }

  void _handlePressRepeat() async {
    _timerSubscription = null;

    // _streamController.add(0);
    // _streamController.addError(Exception('Issue 101'));
    await _streamController.addStream(Stream.error(Exception('Issue 404')));
    setState(() {
      _isStarted = false;
    });
  }

  void _handlePressStartPause() async {
    print(_timerSubscription?.isPaused);
    ;
    if (_timerSubscription?.isPaused == true) {
      _timerSubscription?.resume();
      setState(() {
        _isStarted = !_isStarted;
      });

      return;
    }
    if (_timerSubscription?.isPaused == false) {
      _timerSubscription?.pause();
      setState(() {
        _isStarted = !_isStarted;
      });
      return;
    }

    final stream =
        Stream<int>.periodic(const Duration(seconds: 1), (sec) => sec + 1)
            .take(10);
    setState(() {
      _isStarted = !_isStarted;
    });

    _timerSubscription = stream.listen((data) => _streamController.add(data));
    Future.delayed(const Duration(seconds: 11), () {
      _handlePressRepeat();
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Row(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Icon(Icons.account_circle_rounded, size: 60),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(widget.title),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                StreamBuilder<int>(
                  stream: countStream,
                  initialData: 0,
                  builder: (
                    BuildContext context,
                    AsyncSnapshot<int> snapshot,
                  ) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Visibility(
                            visible: snapshot.hasData,
                            child: Text(
                              snapshot.data.toString(),
                              style: const TextStyle(
                                  color: Colors.teal, fontSize: 36),
                            ),
                          ),
                        ],
                      );
                    }
                    if (snapshot.connectionState == ConnectionState.active ||
                        snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasError) {
                        return const Text('Error');
                      } else if (snapshot.hasData) {
                        return Text(
                          snapshot.data.toString(),
                          style:
                              const TextStyle(color: Colors.teal, fontSize: 36),
                        );
                      } else {
                        return const Text('Empty data');
                      }
                    }
                    return Text('State: ${snapshot.connectionState}');
                  },
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Row(
            children: [
              IconButton(
                onPressed: _handlePressRepeat,
                icon: const Icon(Icons.repeat),
              ),
              IconButton(
                onPressed: _handlePressStartPause,
                icon: Icon(_isStarted ? Icons.pause : Icons.play_arrow),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _timerSubscription?.cancel();
    _streamController.close();
    super.dispose();
  }
}
