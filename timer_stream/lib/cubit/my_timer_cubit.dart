import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

class MyTimerCubit extends Cubit<MyTimerState> {
  MyTimerCubit() : super(const MyTimerState.initial());

  void updateTimer() {
    emit(MyTimerState(count: state.count + 1));
  }

  void resetTimer() {
    emit(const MyTimerState(count: 0));
  }
}

class MyTimerState extends Equatable {
  const MyTimerState({this.count = 0});

  final int count;

  const MyTimerState.initial() : this();

  @override
  List<Object?> get props => [count];
}
