import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'my_timer_event.dart';

part 'my_timer_state.dart';

class MyTimerBloc extends Bloc<MyTimerEvent, MyTimerState> {
  MyTimerBloc() : super(const MyTimerState.initial()) {
    on<UpdateTimer>(
      (event, emit) {
        emit(MyTimerState(count: state.count + 1));
      },
    );
    on<ResetTimer>(
      (event, emit) {
        emit(const MyTimerState(count: 0));
      },
    );
  }
}
