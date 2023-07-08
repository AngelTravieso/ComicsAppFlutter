import 'package:comics_app/config/helpers/helpers.dart';
import 'package:comics_app/presentation/blocs/comic_bloc/comic_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ComicGrid extends StatelessWidget {
  ComicGrid({super.key});

  final boxDecoration = BoxDecoration(
    border: Border.all(
      color: Colors.black,
      width: 2,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return context.select((ComicBloc comicBloc) {
      return GridView.builder(
        itemCount: comicBloc.state.comicsData?.limit,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisExtent: 300,
        ),
        itemBuilder: (context, idx) {
          final comic = comicBloc.state.comicsData?.comics[idx];
          final name = comic?.name;
          final issueNumber = comic?.name;
          return SizedBox(
            child: Column(
              children: <Widget>[
                Container(
                  decoration: boxDecoration,
                  child: Image.network(
                    comic!.image.originalUrl,
                    width: 180,
                    height: 180,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;

                      return Container(
                        height: 180,
                        decoration: boxDecoration.copyWith(
                          color: Colors.grey[350],
                        ),
                        child: const Center(
                          child: CircularProgressIndicator(strokeWidth: 2.5),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    '$name $issueNumber',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Text(
                  DateFormatter.formatDate(
                    comic.dateAdded,
                  ),
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                )
              ],
            ),
          );
        },
      );
    });
  }
}
