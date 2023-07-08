import 'package:animate_do/animate_do.dart';
import 'package:comics_app/config/helpers/helpers.dart';
import 'package:comics_app/domain/model/models.dart';
import 'package:comics_app/presentation/screens/detail_comic_screen.dart';
import 'package:comics_app/presentation/widgets/widgets.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// class [ComicGridItem]
/// This widget renders an element of the comics grid.
///
/// Displays the image, title, and date added for the comic.
/// Clicking on the item navigates to the comic details screen.
class ComicGridItem extends StatelessWidget {
  final Comic comic;

  const ComicGridItem({
    super.key,
    required this.comic,
  });

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      child: GestureDetector(
        child: SizedBox(
          child: Column(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  comic.image.originalUrl,
                  width: 180,
                  height: 180,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;

                    return const ComicImagePlaceholder();
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  '${comic.name} ${comic.issueNumber}',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
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
              )
            ],
          ),
        ),
        onTap: () {
          // print(comic.apiDetailUrl);
          context.pushNamed(DetailComicScreen.name, queryParams: {
            'apiDetailUrl': comic.apiDetailUrl,
          });
        },
      ),
    );
  }
}
