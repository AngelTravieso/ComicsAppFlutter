import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderTitle extends StatelessWidget {
  const HeaderTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Text(
        'ComicBook',
        style: GoogleFonts.kanit().copyWith(
          fontSize: 40,
          fontWeight: FontWeight.w100,
        ),
      ),
    );
  }
}
