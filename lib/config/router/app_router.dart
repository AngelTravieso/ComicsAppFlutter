import 'package:comics_app/presentation/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: ComicsScreen.name,
      builder: (context, state) => const ComicsScreen(),
    ),
    GoRoute(
      path: '/comic_detail',
      name: DetailComicScreen.name,
      pageBuilder: (context, state) {
        final comicDetailUrl = state.queryParams['apiDetailUrl'];

        return CustomTransitionPage(
          child: DetailComicScreen(
            apiDetailurl: comicDetailUrl!,
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity:
                  CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            );
          },
        );
      },
    ),
  ],
);
