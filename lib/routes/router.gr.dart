// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    CounterRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CounterPage(),
      );
    }
  };
}

/// generated route for
/// [CounterPage]
class CounterRoute extends PageRouteInfo<void> {
  const CounterRoute({List<PageRouteInfo>? children})
      : super(
          CounterRoute.name,
          initialChildren: children,
        );

  static const String name = 'CounterRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
