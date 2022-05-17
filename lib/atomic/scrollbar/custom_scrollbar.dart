import 'package:flutter/material.dart';

class CustomScrollBar extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;
  final double? thickness;
  final double? radius;
  const CustomScrollBar({Key? key, required this.child, this.backgroundColor, this.thickness, this.radius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawScrollbar(
        thumbColor: backgroundColor ?? Colors.purple,
        radius: Radius.circular(radius ?? 8),
        thickness: thickness ?? 5,
        child: child);
  }
}
