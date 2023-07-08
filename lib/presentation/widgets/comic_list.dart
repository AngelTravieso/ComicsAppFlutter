import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ComicList extends StatelessWidget {
  const ComicList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 50,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const SizedBox(
            width: 100,
            height: 100,
            child: Placeholder(),
          ),
          title: const Text(
            'DeadPool: Secret Agent',
            textAlign: TextAlign.center,
          ),
          subtitle: const Text(
            'October 03, 2018',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          onTap: () {
            context.push('/comic_detail');
          },
        );
      },
    );
  }
}
