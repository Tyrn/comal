// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:comal/l10n/l10n.dart';
import 'package:comal/routes/routes.gr.dart';
import 'package:comal/splash/splash.dart';

@RoutePage()
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //  title: const Text('Splash Page'),
      // ),
      body: AutoTabsRouter(
        routes: const [
          CounterRoute(),
          AlterCounterRoute(),
        ],
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (context, child, animation) => FadeTransition(
          opacity: animation,
          // the passed child is technically our animated selected-tab page
          child: child,
        ),
        builder: (context, child) {
          final tabsRouter = context.tabsRouter;
          return Scaffold(
            body: child,
            bottomNavigationBar: buildBottomNavigationBar(context, tabsRouter),
          );
        },
      ),
    );
  }
}

BottomNavigationBar buildBottomNavigationBar(
    BuildContext context, TabsRouter tabsRouter,) {
  return BottomNavigationBar(
    onTap: tabsRouter.setActiveIndex,
    currentIndex: tabsRouter.activeIndex,
    items: const [
      BottomNavigationBarItem(icon: Icon(Icons.event), label: 'Counter'),
      BottomNavigationBarItem(icon: Icon(Icons.poll), label: 'AlterCounter'),
    ],
  );
}
