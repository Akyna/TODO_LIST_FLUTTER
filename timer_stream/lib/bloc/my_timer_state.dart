part of 'my_timer_bloc.dart';

@immutable
class MyTimerState extends Equatable {
  const MyTimerState({this.count = 0});

  final int count;

  const MyTimerState.initial() : this();

  @override
  List<Object?> get props => [count];
}