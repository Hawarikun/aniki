import 'package:aniki/features/detail/persentation/view/detail.dart';
import 'package:aniki/features/search/persentation/view/search.dart';
import 'package:aniki/pages/home.dart';
import 'package:aniki/pages/splash.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static const splash = 'splash';
  static const login = 'login';
  static const home = 'home';
  static const detail = 'detail';
  static const search = 'search';

  static final goRouter = GoRouter(
    initialLocation: "/home",
    routes: [
      GoRoute(
        path: "/splash",
        name: splash,
        pageBuilder: _splashPageBuilder,
      ),
      // GoRoute(
      //   path: "/login",
      //   name: login,
      // pageBuilder :
      // ),
      GoRoute(
        path: "/home",
        name: home,
        pageBuilder: _homePageBuilder,
      ),
      GoRoute(
        path: "/detail",
        name: detail,
        pageBuilder: _detailPageBuilder,
      ),
      GoRoute(
        path: "/search",
        name: search,
        pageBuilder: _searchPageBuilder,
      ),
    ],
  );

  void clearAndNavigate(String name) {
    while (goRouter.canPop() == true) {
      goRouter.pop();
    }
    goRouter.pushReplacementNamed(name);
  }

  static Page _splashPageBuilder(context, state) {
    return transition(
      child: const SplashPage(),
    );
  }

  static Page _homePageBuilder(context, state) {
    return transition(
      child: const HomePage(),
    );
  }

  static Page _detailPageBuilder(context, state) {
    return transition(
      child: DetailPage(id: state.extra as String),
    );
  }

  static Page _searchPageBuilder(context, state) {
    return transition(
      child: const SearchPage(),
    );
  }

  static transition({required Widget child}) {
    return CustomTransitionPage(
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      child: child,
    );
  }
}
