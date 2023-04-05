// Package imports:
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_event.dart';
part 'splash_state.dart';
part 'splash_bloc.freezed.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(const SplashState.initial()) {
    on<_Increment>((event, emit) {
      emit(SplashState.current(state.value + 1));
    });
    on<_Decrement>((event, emit) {
      emit(SplashState.current(state.value - 1));
    });
  }
  void increment() => add(const SplashEvent.increment());
  void decrement() => add(const SplashEvent.decrement());
}
