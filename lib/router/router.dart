import 'package:creativenasa/router/refresh_stream.dart';
import 'package:creativenasa/router/routes.dart';
import 'package:creativenasa/view/blocs/auth/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  AppRouter() : routes = Routes();

  final Routes routes;

  GoRouter router(AuthCubit authCubit) {
    return GoRouter(
      navigatorKey: navigatorKey,
      routes: routes.routesList,
      // Refreshes its current route when the stream receives an event
      refreshListenable: GoRouterRefreshStream(authCubit.stream),
      redirect: (context, state) {
        return _redirect(context: context, state: state, authCubit: authCubit);
      },
    );
  }

  String? _redirect({
    required BuildContext context,
    required GoRouterState state,
    required AuthCubit authCubit,
  }) {
    final bool loggedIn = authCubit.state is Authenticated;
    final bool isOnLoginScreen = state.matchedLocation == AppRoute.login.path;

    if (!loggedIn && !isOnLoginScreen) {
      return AppRoute.login.path;
    }

    if (loggedIn && isOnLoginScreen) {
      return AppRoute.gallery.path;
    }

    return null;
  }
}