import 'package:comics_app/config/constants/constants.dart';
import 'package:comics_app/domain/model/models.dart';
import 'package:flutter/material.dart';

/// class [DetailComicSection]
/// This widget represents a section of comic details.
///
/// It displays the section title, a divider, and the content
/// based on the specified [comic] and [section].
class DetailComicSection extends StatelessWidget {
  final String title;
  final Results comic;
  final ComicSection section;

  const DetailComicSection({
    super.key,
    required this.title,
    required this.section,
    required this.comic,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            textAlign: TextAlign.start,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(),
          _buildSection(comic, section),
        ],
      ),
    );
  }

  Widget _buildSection(Results comic, ComicSection section) {
    List<Widget> sectionItems = [];
    switch (section) {
      case ComicSection.characters:
        sectionItems = comic.characterCredits
            .map(
              (item) => ListTile(
                leading: Icon(
                  Icons.circle,
                  color: Colors.purple[800],
                  size: 10,
                ),
                title: Text(item.name),
              ),
            )
            .toList();
        break;
      case ComicSection.teams:
        sectionItems = comic.teamCredits
            .map(
              (item) => ListTile(
                leading: Icon(
                  Icons.circle,
                  color: Colors.blue[800],
                  size: 10,
                ),
                title: Text(item.name),
              ),
            )
            .toList();
        break;
      case ComicSection.location:
        sectionItems = comic.locationCredits
            .map(
              (item) => ListTile(
                leading: Icon(
                  Icons.circle,
                  color: Colors.green[800],
                  size: 10,
                ),
                title: Text(item.name),
              ),
            )
            .toList();
        break;

      default:
        sectionItems = [Text('No $section available')];
    }

    return Column(
      children: [
        if (sectionItems.isNotEmpty) ...sectionItems,
        if (sectionItems.isEmpty)
          ListTile(
            leading: const Icon(
              Icons.close,
              color: Colors.red,
            ),
            title: Text(
              'No ${section.name} available',
              style: const TextStyle(fontSize: 16),
            ),
          )
      ],
    );
  }
}
