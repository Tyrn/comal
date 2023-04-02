// Package imports:
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:comal/counter/counter.dart';

void main() {
  group('CounterBloc', () {
    test('initial state is 0', () {
      expect(CounterBloc().state, equals(0));
    });

    blocTest<CounterBloc, int>(
      'emits [1] when increment is called',
      build: CounterBloc.new,
      act: (bloc) => bloc.add(CounterIncrementPressed()),
      expect: () => [equals(1)],
    );

    blocTest<CounterBloc, int>(
      'emits [-1] when decrement is called',
      build: CounterBloc.new,
      act: (bloc) => bloc.add(CounterDecrementPressed()),
      expect: () => [equals(-1)],
    );
  });
}
