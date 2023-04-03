// Package imports:
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'counter_event.dart';
part 'counter_state.dart';
part 'counter_bloc.freezed.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState.initial()) {
    on<_Increment>((event, emit) {
      emit(CounterState.current(state.value + 1));
    });
    on<_Decrement>((event, emit) {
      emit(CounterState.current(state.value - 1));
    });
  }
  void increment() => add(const CounterEvent.increment());
  void decrement() => add(const CounterEvent.decrement());
}
