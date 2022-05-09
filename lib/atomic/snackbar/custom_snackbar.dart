import 'package:flutter/material.dart';


class CustomSnackBar {
  static void showSnackBar(BuildContext context,String message,{TextStyle? messageStyle,double? margin,Duration? duration,SnackBarAction? action,Color? color,BorderRadius? radius}) {
    var snackbar = SnackBar(
      content: Text(message,
        style: messageStyle ?? const TextStyle(
          color: Colors.white
        ),
      ),
      margin:  EdgeInsets.all(margin ?? 10),
      duration: duration ??const Duration(seconds: 3),
      action: action,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius:radius ?? BorderRadius.circular(10),
      ),
      backgroundColor: color ?? Colors.redAccent,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}
