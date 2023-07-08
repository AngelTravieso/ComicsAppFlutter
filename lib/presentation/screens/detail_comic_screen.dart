import 'package:flutter/material.dart';

class DetailComicScreen extends StatelessWidget {
  const DetailComicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Divider(
              height: 2,
            ),
            Text('Teams'),
            Text('Locations'),
          ],
        ),
      ),
    );
  }
}
