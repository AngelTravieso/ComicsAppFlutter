import 'package:comics_app/presentation/blocs/comic_bloc/comic_bloc.dart';
import 'package:comics_app/presentation/blocs/layout_bloc/layout_bloc.dart';
import 'package:comics_app/presentation/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

/// class [ComicsScreen]
///
/// It uses the [ComicBloc] to fetch the comic data and displays
/// the list of comics in either a grid or list layout based on the
/// state of the [LayoutBloc].
class ComicsScreen extends StatelessWidget {
  static const name = 'comics-screen';
  const ComicsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _ComicsView();
  }
}

class _ComicsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.read<ComicBloc>().getComicData();

    return Scaffold(
      body: Layout(
        child: BlocBuilder<ComicBloc, ComicState>(
          buildWhen: (previous, current) =>
              current.comicsData != previous.comicsData,
          builder: (context, state) {
            if (state.loadingData) {
              return const LoadingIndicator();
            }

            return Column(
              children: <Widget>[
                const HeaderTitle(),
                const LatestIssuesHeader(),
                Expanded(
                    child: context.select(
                  (LayoutBloc layoutBloc) => layoutBloc.state.isGridLayoutMode
                      ? const ComicGrid()
                      : const ComicList(),
                )),
              ],
            );
          },
        ),
      ),
    );
  }
}
