// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:window_size/window_size.dart';

// Project imports:
import 'package:comal/counter/counter.dart';
import 'package:comal/l10n/l10n.dart';
import 'package:comal/platform.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    if (Platform.isDesktop) {
      setWindowTitle("ComaL ABP");
    }
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: const Color(0xFF13B9FF),
        ),
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const CounterPage(),
    );
  }
}
