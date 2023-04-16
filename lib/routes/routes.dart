// Package imports:
import 'package:auto_route/auto_route.dart';

// Project imports:
import 'package:comal/routes/routes.gr.dart';

//part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(path: '/', page: SplashRoute.page),
      ];
}
