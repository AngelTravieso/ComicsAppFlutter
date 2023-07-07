import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  final Function onPressed;
  final IconData icon;
  final String label;

  const CustomOutlinedButton({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.5),
      child: OutlinedButton.icon(
        style: OutlinedButton.styleFrom(
          side: BorderSide.none,
        ),
        onPressed: () => onPressed(),
        icon: Icon(icon),
        label: Text(label),
      ),
    );
  }
}
