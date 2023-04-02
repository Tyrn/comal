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
    late CounterBloc counterBloc;

    setUp(() {
      counterBloc = MockCounterBloc();
    });

    testWidgets('renders current count', (tester) async {
      const state = 42;
      when(() => counterBloc.state).thenReturn(state);
      await tester.pumpApp(
        BlocProvider.value(
          value: counterBloc,
          child: const CounterView(),
        ),
      );
      expect(find.text('$state'), findsOneWidget);
    });

    testWidgets('calls increment when increment button is tapped',
        (tester) async {
      when(() => counterBloc.state).thenReturn(0);
      when(() => counterBloc.add(CounterIncrementPressed())).thenReturn(null);
      await tester.pumpApp(
        BlocProvider.value(
          value: counterBloc,
          child: const CounterView(),
        ),
      );
      await tester.tap(find.byIcon(Icons.add));
      verifyNever(() => counterBloc.add(CounterIncrementPressed()));
    });

    testWidgets('calls decrement when decrement button is tapped',
        (tester) async {
      when(() => counterBloc.state).thenReturn(0);
      when(() => counterBloc.add(CounterDecrementPressed())).thenReturn(null);
      await tester.pumpApp(
        BlocProvider.value(
          value: counterBloc,
          child: const CounterView(),
        ),
      );
      await tester.tap(find.byIcon(Icons.remove));
      verifyNever(() => counterBloc.add(CounterDecrementPressed()));
    });
  });
}
