import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/cubit/auth_cubit.dart';
import '../../features/auth/cubit/auth_state.dart';
import '../../features/auth/ui/login_page.dart';
import '../../features/base/ui/base_page.dart';
import '../ui/pages/error_page.dart';
import 'route_name.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  final AuthCubit authCubit;

  AppRouter(this.authCubit);

  late final router = GoRouter(
    navigatorKey: navigatorKey,
    debugLogDiagnostics: true,
    refreshListenable: GoRouterRefreshStream(authCubit.stream),
    initialLocation: '/${RouteName.login}',
    routes: [
      GoRoute(
        name: RouteName.login,
        path: '/${RouteName.login}',
        builder: (context, state) => LoginPage(),
      ),
      GoRoute(
        name: RouteName.base,
        path: '/${RouteName.base}',
        builder: (context, state) {
          return BasePage();
        },
        routes: [
          GoRoute(
            name: RouteName.fullWeather,
            path: RouteName.fullWeather,
            builder: (context, state) => Container(),
          ),
          GoRoute(
            name: RouteName.newsArticle,
            path: RouteName.newsArticle,
            builder: (context, state) => Container(),
          ),
          GoRoute(
            name: RouteName.themes,
            path: RouteName.themes,
            builder: (context, state) => Container(),
          ),
          GoRoute(
            name: RouteName.langs,
            path: RouteName.langs,
            builder: (context, state) => Container(),
          ),
          GoRoute(
            name: RouteName.myCities,
            path: RouteName.myCities,
            builder: (context, state) => Container(),
          ),
        ],
      ),
    ],
    redirect: (context, state) async {
      final loggedIn = authCubit.state is AuthAuthenticated;
      final loggingIn = state.matchedLocation == '/${RouteName.login}';
      if (!loggedIn && !loggingIn) {
        return '/${RouteName.login}';
      }
      if (loggingIn && !loggingIn) return '/${RouteName.base}';

      return null;
    },
    errorPageBuilder: (context, state) {
      return MaterialPage(
        key: state.pageKey,
        child: const ErrorPage(),
      );
    },
  );
}

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<AuthState> stream) {
    stream.listen((_) {
      notifyListeners();
    });
  }
}
