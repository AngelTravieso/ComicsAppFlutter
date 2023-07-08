import 'package:comics_app/presentation/screens/screens.dart';
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
      builder: (context, state) {
        final comicDetailUrl = state.queryParams['apiDetailUrl'];

        return DetailComicScreen(
          apiDetailurl: comicDetailUrl!,
        );
      },
    ),
  ],
);
