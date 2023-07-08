import 'package:animate_do/animate_do.dart';
import 'package:comics_app/config/helpers/helpers.dart';
import 'package:comics_app/presentation/blocs/comic_bloc/comic_bloc.dart';
import 'package:comics_app/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ComicList extends StatelessWidget {
  const ComicList({super.key});

  @override
  Widget build(BuildContext context) {
    return context.select((ComicBloc comicBloc) {
      return ListView.builder(
        itemCount: comicBloc.state.comicsData?.limit,
        itemBuilder: (context, idx) {
          final comic = comicBloc.state.comicsData!.comics[idx];
          return GestureDetector(
            child: FadeIn(
              child: Card(
                clipBehavior: Clip.antiAlias,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 10,
                      child: Image.network(
                        comic.image.originalUrl,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;

                          return const ComicImagePlaceholder();
                        },
                      ),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    Expanded(
                      flex: 14,
                      child: Column(
                        children: <Widget>[
                          Text(
                            '${comic.name} ${comic.issueNumber}',
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            DateFormatter.formatDate(
                              comic.dateAdded,
                            ),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            onTap: () {
              context.push('/comic_detail');
            },
          );
        },
      );
    });
  }
}
