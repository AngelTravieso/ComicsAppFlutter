import 'package:comics_app/config/constants/constants.dart';
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
      body: BlocBuilder<ComicBloc, ComicState>(
        builder: (context, state) {
          if (state.loadingData) {
            return const LoadingIndicator(
              loadingText: 'Loading comic...',
            );
          }

          return SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 400,
                  child: Stack(
                    alignment: Alignment.center,
                    fit: StackFit.expand,
                    children: <Widget>[
                      Container(
                        child: state.comicDetail != null
                            ? Image.network(
                                state.comicDetail!.results.image.originalUrl,
                                fit: BoxFit.cover,
                              )
                            : Image.asset(
                                'assets/image/image_not_available.png',
                              ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Colors.transparent,
                              Colors.black.withOpacity(
                                0.5,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                DetailComicSection(
                  title: 'Characters',
                  section: ComicSection.characters,
                  comic: state.comicDetail!.results,
                ),
                DetailComicSection(
                  title: 'Teams',
                  section: ComicSection.teams,
                  comic: state.comicDetail!.results,
                ),
                DetailComicSection(
                  title: 'Locations',
                  section: ComicSection.location,
                  comic: state.comicDetail!.results,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
