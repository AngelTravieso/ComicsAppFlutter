import 'package:animate_do/animate_do.dart';
import 'package:comics_app/config/helpers/helpers.dart';
import 'package:comics_app/domain/model/models.dart';
import 'package:comics_app/presentation/widgets/widgets.dart';

import 'package:flutter/material.dart';

class ComicGridItem extends StatelessWidget {
  final Comic comic;

  const ComicGridItem({
    super.key,
    required this.comic,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: <Widget>[
          FadeIn(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                ),
              ),
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
            style: const TextStyle(
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}