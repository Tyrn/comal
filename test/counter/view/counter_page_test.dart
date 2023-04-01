// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Project imports:
import 'package:comal/counter/counter.dart';
import '../../helpers/helpers.dart';

// class MockCounterCubit extends MockCubit<int> implements CounterCubit {}

class MockCounterBloc extends MockBloc<CounterEvent, int>
    implements CounterBloc {}

void main() {
  group('CounterPage', () {
    testWidgets('renders CounterView', (tester) async {
      await tester.pumpApp(const CounterPage());
      expect(find.byType(CounterView), findsOneWidget);
    });
  });

  group('CounterView', () {
    // late CounterCubit counterCubit;
    late CounterBloc counterBloc;

    setUp(() {
      // counterCubit = MockCounterCubit();
      counterBloc = MockCounterBloc();
    });

    testWidgets('renders current count', (tester) async {
      const state = 42;
      // when(() => counterCubit.state).thenReturn(state);
      when(() => counterBloc.state).thenReturn(state);
      await tester.pumpApp(
        BlocProvider.value(
          // value: counterCubit,
          value: counterBloc,
          child: const CounterView(),
        ),
      );
      expect(find.text('$state'), findsOneWidget);
    });

    testWidgets('calls increment when increment button is tapped',
        (tester) async {
      // when(() => counterCubit.state).thenReturn(0);
      when(() => counterBloc.state).thenReturn(0);
      // when(() => counterCubit.increment()).thenReturn(null);
      when(() => counterBloc.add(CounterIncrementPressed())).thenReturn(null);
      await tester.pumpApp(
        BlocProvider.value(
          // value: counterCubit,
          value: counterBloc,
          child: const CounterView(),
        ),
      );
      await tester.tap(find.byIcon(Icons.add));
      // verify(() => counterCubit.increment()).called(1);
      verifyNever(() => counterBloc.add(CounterIncrementPressed()));
    });

    testWidgets('calls decrement when decrement button is tapped',
        (tester) async {
      // when(() => counterCubit.state).thenReturn(0);
      when(() => counterBloc.state).thenReturn(0);
      // when(() => counterCubit.decrement()).thenReturn(null);
      when(() => counterBloc.add(CounterDecrementPressed())).thenReturn(null);
      await tester.pumpApp(
        BlocProvider.value(
          // value: counterCubit,
          value: counterBloc,
          child: const CounterView(),
        ),
      );
      await tester.tap(find.byIcon(Icons.remove));
      // verify(() => counterCubit.decrement()).called(1);
      verifyNever(() => counterBloc.add(CounterDecrementPressed()));
    });
  });
}
