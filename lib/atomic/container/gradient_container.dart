import 'package:flutter/material.dart';

class GradientContainer extends Container {
  GradientContainer({Key? key, required BuildContext context, required Widget child, List<Color>? colors})
      : super(
          key: key,
          child: child,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: colors ?? [Colors.black, Colors.blueGrey],
            ),
          ),
        );
}
