import 'dart:ui';

import 'package:flutter/material.dart';

import 'glow_image_clip.dart';

// inspired from philipcdavis : https://github.com/philipcdavis/swiftui-photoTintedShadows-example

class GlowImage extends StatelessWidget {
  const GlowImage(
      {Key? key,
      this.blurRadius,
      this.cornerRadius,
      this.blurOpacity,
      this.blurOffset,
      this.padding,
      required this.child})
      : super(key: key);

  final double? blurRadius;
  final double? cornerRadius;
  final double? blurOpacity;
  final double? blurOffset;
  final double? padding;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    var _blurOffset = blurOffset ?? 20;
    return SizedBox(
      child: Stack(
        children: [
          if (blurOpacity != 0 || blurOpacity == null)
            GlowClipRRect(child: child, radius: blurRadius),
          Opacity(
            opacity: blurOpacity ?? 1,
            child: BackdropFilter(
              filter:
                  ImageFilter.blur(sigmaX: _blurOffset, sigmaY: _blurOffset),
              child: Container(),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(padding ?? 10.0),
            child: GlowClipRRect(child: child, radius: blurRadius),
          ),
        ],
      ),
    );
  }
}
