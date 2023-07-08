import 'package:comics_app/presentation/blocs/comic_bloc/comic_bloc.dart';
import 'package:comics_app/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// class [ComicGrid]
///
/// This widget displays a grid of comics using a `CustomScrollView` and a `SliverGrid`.
///
/// Use the state of the `ComicBloc` to get the comics data and build the grid.
class ComicGrid extends StatelessWidget {
  const ComicGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return context.select(
      (ComicBloc comicBloc) {
        return CustomScrollView(
          slivers: [
            SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: _calculateCrossAxisCount(context),
                crossAxisSpacing: 10,
                mainAxisExtent: 300,
              ),
              delegate: SliverChildBuilderDelegate(
                childCount: comicBloc.state.comicsData?.limit,
                (context, idx) {
                  final comic = comicBloc.state.comicsData?.comics[idx];

                  return ComicGridItem(
                    comic: comic!,
                  );
                },
              ),
            )
          ],
        );
      },
    );
  }

  /// Calculates the number of columns for a grid based on the width of the screen.
  /// Returns the calculated number of columns.
  ///
  /// [context]: The context of the application.
  int _calculateCrossAxisCount(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;

    if (screenWidth >= 600) {
      // Larger devices, 4 columns
      return 4;
    } else if (screenWidth >= 400) {
      // Medium devices, 3 columns
      return 3;
    } else {
      // Smaller devices, 2 columns
      return 2;
    }
  }
}
