import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer_stream/bloc/my_timer_bloc.dart';

class BlocListTile extends StatefulWidget {
  const BlocListTile({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  State<BlocListTile> createState() => _BlocListTileState();
}

/// AutomaticKeepAliveClientMixin
/// for keeping state inside list
class _BlocListTileState extends State<BlocListTile>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final int _quantity = 10;
  final _isStarted = ValueNotifier<bool>(false);
  final _isAvailable = ValueNotifier<bool>(true);

  Timer _timer = Timer(Duration.zero, () {});

  @override
  initState() {
    super.initState();
  }

  void _handlePressRepeat() async {
    _timer.cancel();
    _timer = Timer(Duration.zero, () {});
    context.read<MyTimerBloc>().add(ResetTimer());
    _isStarted.value = false;
  }

  void _handlePressStartPause() {
    if (_timer.isActive) {
      _timer.cancel();
      _isStarted.value = !_isStarted.value;
      return;
    }
    _timer = Timer.periodic(const Duration(seconds: 1), _handleTimerFinish);
    _isStarted.value = !_isStarted.value;
  }

  void _handleTimerFinish(timer) async {
    context.read<MyTimerBloc>().add(UpdateTimer());

    /// Wait for next iteration of the event-loop
    /// to ensure event has been processed.
    /// because if we read context.read<MyTimerBloc>().state.count
    /// it will be the same
    /// 0
    /// 0
    /// therefore we do
    /// await Future<void>.delayed(Duration.zero)
    /// and then value will be
    /// 0
    /// 1
    await Future<void>.delayed(Duration.zero);
    if (context.read<MyTimerBloc>().state.count == _quantity) {
      timer.cancel();
      _isStarted.value = false;
      _isAvailable.value = false;
    }
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
              child: BlocBuilder<MyTimerBloc, MyTimerState>(
                builder: (context, state) {
                  return Text(
                    _printDuration(Duration(seconds: state.count)),
                    style: const TextStyle(
                      color: Colors.teal,
                      fontSize: 26,
                      fontFeatures: [FontFeature.tabularFigures()],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ValueListenableBuilder(
                valueListenable: _isAvailable,
                builder: (_, bool value, __) {
                  return IconButton(
                    onPressed: value ? _handlePressRepeat : null,
                    icon: const Icon(Icons.repeat),
                  );
                },
              ),
              ValueListenableBuilder(
                valueListenable: _isAvailable,
                builder: (_, bool parentValue, __) {
                  return ValueListenableBuilder(
                    valueListenable: _isStarted,
                    builder: (context, bool value, Widget? child) {
                      return IconButton(
                        onPressed: parentValue ? _handlePressStartPause : null,
                        icon: Icon(
                          value ? Icons.pause : Icons.play_arrow,
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
