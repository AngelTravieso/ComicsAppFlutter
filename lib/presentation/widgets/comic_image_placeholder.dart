import 'package:flutter/material.dart';

class ComicImagePlaceholder extends StatelessWidget {
  const ComicImagePlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      decoration: BoxDecoration(
        color: Colors.grey[350],
        border: Border.all(
          color: Colors.black,
          width: 2,
        ),
      ),
      child: const Center(
        child: CircularProgressIndicator(
          strokeWidth: 2.5,
        ),
      ),
    );
  }
}
