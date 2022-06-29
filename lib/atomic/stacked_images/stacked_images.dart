import 'package:flutter/material.dart';

/// With this widget we can show stacked nice looking images in our app.
/// I used Image.network for loading images from network.
/// Factory constructor can be add for this widget to work with assets etc.
/// Should call it in [Stack] Widget

/*
Stack(children: [
  StackImages(images: images),
  StackImages(images: images2),]
  ,)]); 

etc.*/

class StackImageWidget extends StatelessWidget {
  const StackImageWidget({
    Key? key,
    required this.img,
    required this.angle,
    this.ofset1 = 0.0,
    this.ofset2 = 0.0,
    this.radius = 20.0,
  }) : super(key: key);

  final String img;
  final double ofset1;
  final double ofset2;
  final double angle;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      alignment: Alignment.center,
      angle: angle,
      child: Transform.translate(
        offset: Offset(ofset1, ofset2),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child: Image.network(
            img,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
