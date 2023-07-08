import 'package:comics_app/presentation/blocs/comic_bloc/comic_bloc.dart';
import 'package:comics_app/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

  int _calculateCrossAxisCount(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

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
