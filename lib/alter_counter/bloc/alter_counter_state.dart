part of 'alter_counter_bloc.dart';

@freezed
class AlterCounterState with _$AlterCounterState {
  const factory AlterCounterState.initial([@Default(0) int value]) = _Initial;
  const factory AlterCounterState.current(int value) = _Current;
}
