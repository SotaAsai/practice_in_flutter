import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shell_route/details_screen.dart';
import 'package:shell_route/root_screen.dart';
import 'package:shell_route/scaffold_with_nav_bar.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorAKey = GlobalKey<NavigatorState>();
final _shellNavigatorBKey = GlobalKey<NavigatorState>();

/**
 * ・navigatotKeyのパラメータをコメントアウトしても同じ挙動
 * ・挙動がわかっていないクラスやメソッドなど
 *  ・StatefulShellRoute
 *  ・StatefulShellRoute.indexedStack
 *  ・StatefulShellBranch
 *  ・NoTransitionPage
 *  ・GoRouterのbuilderとpageBuilderの違い
 *  ・StatefulNavigationShell.goBranch
 */

final goRouter = GoRouter(
  // navigatorKey: _rootNavigatorKey,
  initialLocation: '/a',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return ScaffoldWithNavBar(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          // navigatorKey: _shellNavigatorAKey,
          routes: [
            GoRoute(
              path: '/a',
              pageBuilder:
                  (context, state) => const NoTransitionPage(
                    child: RootScreen(
                      label: 'Tab A',
                      detailsPath: '/a/details',
                    ),
                  ),
              routes: [
                GoRoute(
                  path: 'details',
                  builder:
                      (context, state) => const DetailsScreen(label: 'Tab A'),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          // navigatorKey: _shellNavigatorBKey,
          routes: [
            GoRoute(
              path: '/b',
              pageBuilder:
                  (context, state) => const NoTransitionPage(
                    child: RootScreen(
                      label: 'Tab B',
                      detailsPath: '/b/details',
                    ),
                  ),
              routes: [
                GoRoute(
                  path: 'details',
                  builder:
                      (context, state) => const DetailsScreen(label: 'Tab B'),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);
