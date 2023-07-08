import 'package:comics_app/presentation/blocs/comic_bloc/comic_bloc.dart';
import 'package:comics_app/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailComicScreen extends StatelessWidget {
  static const name = 'detail-comic-screen';

  final String apiDetailurl;

  const DetailComicScreen({
    super.key,
    required this.apiDetailurl,
  });

  @override
  Widget build(BuildContext context) {
    context.read<ComicBloc>().getComicDetail(comicUrl: apiDetailurl);

    return Scaffold(
      body: Layout(
        child: BlocBuilder<ComicBloc, ComicState>(
          builder: (context, state) {
            if (state.loadingData) {
              return const LoadingIndicator(
                loadingText: 'Loading comic...',
              );
            }

            print(state.comicDetail);
            print(state.comicDetail?.results.name);

            return Center(
              child: Text(state.comicDetail?.results.name ?? 'No-name'),
            );
          },
        ),
      ),
    );
  }
}
