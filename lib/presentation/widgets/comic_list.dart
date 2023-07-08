import 'package:comics_app/presentation/blocs/comic_bloc/comic_bloc.dart';
import 'package:comics_app/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// class [ComicList]
/// This widget displays a list of comics using a ListView.builder.
///
/// It uses the state of the ComicBloc to retrieve the comic data and build the list.
class ComicList extends StatelessWidget {
  const ComicList({super.key});

  @override
  Widget build(BuildContext context) {
    return context.select((ComicBloc comicBloc) {
      return ListView.builder(
        itemCount: comicBloc.state.comicsData?.limit,
        itemBuilder: (context, idx) {
          final comic = comicBloc.state.comicsData!.comics[idx];
          return ComicListItem(comic: comic);
        },
      );
    });
  }
}
