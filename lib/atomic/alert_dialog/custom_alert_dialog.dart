import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// WIDGET DESCRIPTION
// This widget is the alert dialog that changes according to your iOS and Android device.
// [Tr] Bu widget ios ve android cihaza göre değişen native görünüm elde etmeye çalışan ve belirlediğiniz sabit değişkenlere göre
// kullanabileceğiniz custom alert dialogtur.

showAlertDialog(
  BuildContext context, {
  required String title,
  required String content,
  String? cancelActionText,
  required String defaultActionText,
  required VoidCallback onPressed,
}) {
  if (!Platform.isIOS) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
              title: Text(title),
              content: Text(content),
              actions: [
                if (cancelActionText != null)
                  TextButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: Text(cancelActionText)),
                TextButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    child: Text(defaultActionText))
              ],
            ));
  }
  return showCupertinoDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => CupertinoAlertDialog(
            title: Text(title),
            content: Text(content),
            actions: [
             if (cancelActionText != null)
                TextButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: Text(cancelActionText)),
              CupertinoDialogAction(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: Text(defaultActionText))
            ],
          ));
}
