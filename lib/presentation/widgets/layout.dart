import 'package:flutter/material.dart';

/// class [Layout]
/// This widget represents a layout wrapper for its child widget.
///
/// It applies padding to its child widget using `EdgeInsets.all(10)`.
class Layout extends StatelessWidget {
  final Widget child;

  const Layout({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: child,
    );
  }
}
