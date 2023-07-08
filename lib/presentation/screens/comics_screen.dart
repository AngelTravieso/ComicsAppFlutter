import 'package:comics_app/presentation/blocs/comic_bloc/comic_bloc.dart';
import 'package:comics_app/presentation/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class ComicsScreen extends StatelessWidget {
  const ComicsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ComicBloc(),
      child: _ComicsView(),
    );
  }
}

class _ComicsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.read<ComicBloc>().getComicData();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: BlocBuilder<ComicBloc, ComicState>(
          buildWhen: (previous, current) =>
              current.comicsData != previous.comicsData,
          builder: (context, state) {
            if (state.loadingData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return Column(
              children: <Widget>[
                const HeaderTitle(),
                const LatestIssuesHeader(),
                Expanded(
                  child: ComicGrid(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
