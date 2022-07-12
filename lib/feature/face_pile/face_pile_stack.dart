import 'package:flutter/material.dart';

class FaceStack extends StatelessWidget {
  final double width;
  final double offsetValue;

  final List<String> urls;
  final Color borderColor;
  final double borderWidth;
  const FaceStack({
    Key? key,
    required this.width,
    required this.offsetValue,
    required this.borderWidth,
    required this.borderColor,
    required this.urls,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: width,
      width: frameWidth,
      child: Stack(
        children: generateFacePile(context),
      ),
    );
  }

  double calculatedOffset(int index) => index * (width * offsetValue);

  double get frameWidth => urls.length * (width * offsetValue) + (width * (1 - offsetValue));

  List<Widget> generateFacePile(BuildContext context) {
    return List.generate(urls.length, (index) => generateAvatar(context, index));
  }

  Widget generateAvatar(BuildContext context, int index) {
    return Positioned(
      left: calculatedOffset(index),
      child: Container(
        width: width,
        height: width,
        decoration: _buildAvatarDecoration(),
        child: CircleAvatar(
          foregroundImage: NetworkImage(urls[index]),
          radius: (width - borderWidth),
        ),
      ),
    );
  }

  BoxDecoration _buildAvatarDecoration() {
    return BoxDecoration(
      border: Border.all(color: borderColor, width: borderWidth),
      borderRadius: BorderRadius.all(
        Radius.circular(width / 2),
      ),
    );
  }
}
