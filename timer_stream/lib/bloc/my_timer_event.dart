part of 'my_timer_bloc.dart';

@immutable
abstract class MyTimerEvent {}

class UpdateTimer extends MyTimerEvent {}
class ResetTimer extends MyTimerEvent {}
