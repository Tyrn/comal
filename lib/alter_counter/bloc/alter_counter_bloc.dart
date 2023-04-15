// Package imports:
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'alter_counter_event.dart';
part 'alter_counter_state.dart';
part 'alter_counter_bloc.freezed.dart';

class AlterCounterBloc extends Bloc<AlterCounterEvent, AlterCounterState> {
  AlterCounterBloc() : super(const AlterCounterState.initial()) {
    on<_Increment>((event, emit) {
      emit(AlterCounterState.current(state.value + 1));
    });
    on<_Decrement>((event, emit) {
      emit(AlterCounterState.current(state.value - 1));
    });
  }
  void increment() => add(const AlterCounterEvent.increment());
  void decrement() => add(const AlterCounterEvent.decrement());
}
