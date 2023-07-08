import 'package:comics_app/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class DetailComicScreen extends StatelessWidget {
  const DetailComicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Center(
          child: Column(
            children: <Widget>[
              HeaderTitle(),
            ],
          ),
        ),
      ),
    );
  }
}
