part of 'alter_counter_bloc.dart';

@freezed
class AlterCounterEvent with _$AlterCounterEvent {
  // const factory CounterEvent.started() = _Started;
  const factory AlterCounterEvent.increment() = _Increment;
  const factory AlterCounterEvent.decrement() = _Decrement;
}
