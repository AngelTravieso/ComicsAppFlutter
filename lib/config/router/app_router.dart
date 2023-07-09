import 'package:comics_app/presentation/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// [appRouter]
final appRouter = GoRouter(
  initialLocation: '/', // Set the initial route to '/'
  routes: [
    GoRoute(
      path: '/', // Define the route path as '/'
      name: ComicsScreen.name, // Set the route name to the ComicsScreen name
      builder: (context, state) =>
          const ComicsScreen(), // Build the ComicsScreen widget
    ),
    GoRoute(
      path: '/comic_detail', // Define the route path as '/comic_detail'
      name: DetailComicScreen
          .name, // Set the route name to the DetailComicScreen name
      pageBuilder: (context, state) {
        // Retrieve the 'apiDetailUrl' parameter from the query parameters
        final comicDetailUrl = state.queryParams['apiDetailUrl'];

        return CustomTransitionPage(
          // Use CustomTransitionPage for custom transition animation
          child: DetailComicScreen(
            apiDetailurl:
                comicDetailUrl!, // Pass the 'apiDetailUrl' to the DetailComicScreen
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            // Define the transition animation using FadeTransition
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
