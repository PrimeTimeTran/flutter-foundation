import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:{{name}}/all.dart';

final goRouter = GoRouter(
  initialLocation: '/',
  navigatorKey: _rootNavigatorKey,
  observers: [],
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, shell) {
        return App(shell: shell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _shellNavigatorAKey,
          routes: [
            GoRoute(
              path: '/',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: HomeScreen(),
              ),
              routes: const [],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorBKey,
          routes: [
            GoRoute(
              path: '/design-guide',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: DesignGuideScreen(),
              ),
              routes: const [],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorCKey,
          routes: [
            GoRoute(
              path: '/funds',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: FundsScreen(),
              ),
              routes: const [],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorDKey,
          routes: [
            GoRoute(
              path: '/investors',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: InvestorsScreen(),
              ),
              routes: const [],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorEKey,
          routes: [
            GoRoute(
              path: '/profile',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: ProfileScreen(),
              ),
              routes: const [],
            ),
          ],
        ),
      ],
    ),
  ],
);

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final _shellNavigatorAKey = GlobalKey<NavigatorState>(debugLabel: 'shellA');
final _shellNavigatorBKey = GlobalKey<NavigatorState>(debugLabel: 'shellB');
final _shellNavigatorCKey = GlobalKey<NavigatorState>(debugLabel: 'shellC');
final _shellNavigatorDKey = GlobalKey<NavigatorState>(debugLabel: 'shellD');
final _shellNavigatorEKey = GlobalKey<NavigatorState>(debugLabel: 'shellE');

buildRoute(path, Widget widget, [List<RouteBase>? routes]) {
  return GoRoute(
    path: path,
    pageBuilder: (context, state) => NoTransitionPage(
      key: state.pageKey,
      child: widget,
    ),
    routes: (routes ?? <RouteBase>[]),
  );
}
