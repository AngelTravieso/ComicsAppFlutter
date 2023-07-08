import 'package:comics_app/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const ComicsScreen(),
    ),
    GoRoute(
      path: '/comic_detail',
      builder: (context, state) => const DetailComicScreen(),
    ),
  ],
);
