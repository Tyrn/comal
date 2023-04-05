part of 'splash_bloc.dart';

@freezed
class SplashState with _$SplashState {
  const factory SplashState.initial([@Default(0) int value]) = _Initial;
  const factory SplashState.current(int value) = _Current;
}
