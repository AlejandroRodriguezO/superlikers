import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:superlikers/core/constants/keys.dart';

import '../../../features/features.dart';
import '../../core.dart';

mixin RouterMixin on State<MyApp> {
  GoRouter? _router;

  GoRouter get router {
    _router ??= GoRouter(
      debugLogDiagnostics: true,
      initialLocation: RoutesEnum.login.path,
      redirect: (BuildContext context, GoRouterState state) {
        final String isLogin = locator<LocalStorage>().getString(kToken);

        final bool isInStatefulShellRoute =
            state.fullPath == RoutesEnum.summary.path ||
                state.fullPath == RoutesEnum.bonus.path ||
                state.fullPath == RoutesEnum.selfExecution.path;

        if (isLogin.isNotEmpty && !isInStatefulShellRoute) {
          return RoutesEnum.summary.path;
        }

        if (isLogin.isEmpty && state.fullPath != RoutesEnum.login.path) {
          return RoutesEnum.login.path;
        }

        return null;
      },
      routes: <RouteBase>[
        GoRoute(
          name: RoutesEnum.login.name,
          path: RoutesEnum.login.path,
          builder: (_, __) {
            return const SignInScreen();
          },
        ),
        StatefulShellRoute.indexedStack(
          builder: (BuildContext context, GoRouterState state,
                  StatefulNavigationShell navigationShell) =>
              MainScreen(
            child: navigationShell,
          ),
          branches: <StatefulShellBranch>[
            StatefulShellBranch(
              routes: <RouteBase>[
                GoRoute(
                  name: RoutesEnum.bonus.name,
                  path: RoutesEnum.bonus.path,
                  builder: (BuildContext context, GoRouterState state) =>
                     Center(
                    child: Text(
                      'En construcción',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
            StatefulShellBranch(
              routes: <RouteBase>[
                GoRoute(
                  name: RoutesEnum.summary.name,
                  path: RoutesEnum.summary.path,
                  builder: (BuildContext context, GoRouterState state) =>
                      BlocProvider<SummaryCubit>(
                    create: (_) => locator<SummaryCubit>()..getEntries(),
                    child: const SummaryScreen(),
                  ),
                )
              ],
            ),
            StatefulShellBranch(
              routes: <RouteBase>[
                GoRoute(
                  name: RoutesEnum.selfExecution.name,
                  path: RoutesEnum.selfExecution.path,
                  builder: (BuildContext context, GoRouterState state) =>
                      Center(
                    child: Text(
                      'En construcción',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        )
      ],
    );
    return _router!;
  }
}
