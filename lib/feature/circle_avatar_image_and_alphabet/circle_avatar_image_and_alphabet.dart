import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:kartal/kartal.dart';

class CircleAvatarImageAndAlphabet extends StatelessWidget {
  final Function()? onTap;
  final String? imagePath;
  final String? text;
  final int? color;
  final bool isFullText;
  final double radius;

  const CircleAvatarImageAndAlphabet({Key? key, this.onTap, required this.radius, this.text, this.imagePath, this.color, this.isFullText = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        CircleAvatar(
            backgroundImage: imagePath == null ? null : FileImage(File(imagePath!)),
            radius: radius,
            child: imagePath == null
                ? Padding(
                    padding: context.paddingLow,
                    child: AutoSizeText(
                      text != null ? getTextFirsCharter(text!) : " ",
                      style: Theme.of(context).textTheme.headline3,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                    ),
                  )
                : null,
            backgroundColor: color != null ? Color(color!) : null),
      ]),
    );
  }

  String getTextFirsCharter(String text) {
    String value = "";
    var splitTextList = text.split(" ");

    if (isFullText) {
      return text.toUpperCase();
    } else {
      for (var element in splitTextList) {
        if (element.isNotNullOrNoEmpty) {
          value = value + element[0];
        }
      }

      return value.toUpperCase();
    }
  }
}
