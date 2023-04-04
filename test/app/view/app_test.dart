// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:comal/app/app.dart';
import 'package:comal/counter/counter.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(App());
      expect(find.byType(CounterPage), findsOneWidget);
    });
  });
}
