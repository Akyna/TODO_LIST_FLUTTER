import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';

class StreamListTile extends StatefulWidget {
  const StreamListTile({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  State<StreamListTile> createState() => _StreamListTileState();
}

/// AutomaticKeepAliveClientMixin
/// for keeping state inside list
class _StreamListTileState extends State<StreamListTile>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  final _quantity = 10;
  final _streamController = StreamController<int>();

  late final Stream<int> countStream;
  StreamSubscription<int>? _timerSubscription;

  bool _isStarted = false;
  bool _isAvailable = true;

  @override
  initState() {
    super.initState();

    countStream = _streamController.stream.asBroadcastStream();
    countStream.listen(_handleStopTimer);
  }

  void _handleStopTimer(data) {
    if (data == _quantity) {
      setState(() {
        _timerSubscription?.cancel();
        _timerSubscription = null;
        _isStarted = false;
        _isAvailable = false;
      });
    }
  }

  void _handlePressRepeat() async {
    setState(() {
      _streamController.add(0);
      _timerSubscription?.cancel();
      _timerSubscription = null;
      _isStarted = false;
    });
  }

  void _handlePressStartPause() {
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
            .take(_quantity);
    setState(() {
      _isStarted = !_isStarted;
    });

    _timerSubscription = stream.listen((data) => _streamController.add(data));
  }

  String _printDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
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
          flex: 2,
          child: Container(
            padding: const EdgeInsets.all(8),
            child: Center(
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
                                _printDuration(
                                    Duration(seconds: snapshot.data ?? 0)),
                                // snapshot.data.toString(),
                                style: const TextStyle(
                                  color: Colors.teal,
                                  fontSize: 26,
                                  fontFeatures: [FontFeature.tabularFigures()],
                                ),
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
                            _printDuration(
                                Duration(seconds: snapshot.data ?? 0)),
                            // snapshot.data.toString(),
                            style: const TextStyle(
                              color: Colors.teal,
                              fontSize: 26,
                              fontFeatures: [FontFeature.tabularFigures()],
                            ),
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
        ),
        Expanded(
          flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: _isAvailable ? _handlePressRepeat : null,
                icon: const Icon(Icons.repeat),
              ),
              IconButton(
                onPressed: _isAvailable ? _handlePressStartPause : null,
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
