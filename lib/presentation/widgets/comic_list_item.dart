import 'package:animate_do/animate_do.dart';
import 'package:comics_app/config/helpers/helpers.dart';
import 'package:comics_app/domain/model/models.dart';
import 'package:comics_app/presentation/screens/screens.dart';
import 'package:comics_app/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// class [ComicListItem]
/// This widget represents an item in a comic list.
///
/// It displays an image, comic title, and date added in a card layout.
/// Tapping on the item triggers a navigation to the comic detail screen.
class ComicListItem extends StatelessWidget {
  final Comic comic;

  const ComicListItem({
    super.key,
    required this.comic,
  });

  @override
  Widget build(BuildContext context) {
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
      onTap: () => context.pushNamed(DetailComicScreen.name, queryParams: {
        'apiDetailUrl': comic.apiDetailUrl,
      }),
    );
  }
}
