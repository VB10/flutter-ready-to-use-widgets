import 'package:flutter/material.dart';

class GlowClipRRect extends StatelessWidget {
  const GlowClipRRect({
    Key? key,
    required this.child,
    this.radius,
  }) : super(key: key);

  final Widget child;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius ?? 30),
      child: child,
    );
  }
}
