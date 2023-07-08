import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  final Function onPressed;
  final IconData icon;
  final String label;
  final Color? selectedColor;

  const CustomOutlinedButton({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.label,
    this.selectedColor,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.5),
      child: OutlinedButton.icon(
        style: OutlinedButton.styleFrom(
          side: BorderSide.none,
          foregroundColor: selectedColor ?? colors.primary,
        ),
        onPressed: () => onPressed(),
        icon: Icon(icon),
        label: Text(label),
      ),
    );
  }
}
