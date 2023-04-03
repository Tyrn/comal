part of 'counter_bloc.dart';

@freezed
class CounterEvent with _$CounterEvent {
  // const factory CounterEvent.started() = _Started;
  const factory CounterEvent.increment() = _Increment;
  const factory CounterEvent.decrement() = _Decrement;
}
