part of 'splash_bloc.dart';

@freezed
class SplashEvent with _$SplashEvent {
  const factory SplashEvent.increment() = _Increment;
  const factory SplashEvent.decrement() = _Decrement;
}
