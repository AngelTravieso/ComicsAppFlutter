import 'package:comics_app/config/router/app_router.dart';
import 'package:comics_app/config/theme/app_theme.dart';
import 'package:comics_app/presentation/blocs/comic_bloc/comic_bloc.dart';
import 'package:comics_app/presentation/blocs/layout_bloc/layout_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/material.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ComicBloc>(
          create: (_) => ComicBloc(),
        ),
        BlocProvider<LayoutBloc>(
          create: (_) => LayoutBloc(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: appRouter,
        theme: AppTheme(selectedColor: 4).getTheme(),
      ),
    );
  }
}
