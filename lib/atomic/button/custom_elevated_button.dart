import 'package:flutter/material.dart';
import 'package:ready_to_use_widgets/core/init/constants/color_constant.dart';

// WIDGET DESCRIPTION
// It is a widget where you can set your button as you want and make new widgets for your own buttons.
// [Tr] Bu widget projenizde bulunan butonlar için hızlıca kullanabileceğiniz hatta bu widget üzerinden yeni butonlar oluşturabileceğiniz bir yapıdadır.
// Özel tasarımlar için style tarafında yapılacak tanımlamaları eklemeyi unutmayınız.

class CustomElevatedButton extends StatelessWidget {
  final Widget child;
  final Color? color;
  final double? height;
  final double? width;
  final double? borderRadius;
  final VoidCallback? onPressed;

  const CustomElevatedButton(
      {Key? key,
      this.color,
      this.height,
      this.width,
      this.borderRadius,
      this.onPressed,
      required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 250,
      height: height ?? 50,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(color ?? ColorConstants.amaranth),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 2),
              ),
            ),
          ),
          child: child),
    );
  }
}



// Example Usages

// With Text Widget create normal button
/* 
 CustomElevatedButton(
                color: Colors.red,
                height: 50,
                width: 200,
                borderRadius: 20,
                onPressed: () {},
                child: Text("Custom Button")),
                */

// With Icon 
/* 
 CustomElevatedButton(
                color: Colors.blue,
                height: 40,
                width: 60,
                borderRadius: 40,
                onPressed: () {},
                child: Icon(Icons.share)),



*/


// With Icon + Text

/* 
CustomElevatedButton(
                color: Colors.blue,
                height: 40,
                width: 200,
                borderRadius: 40,
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.payment),
                    Text("Payment"),
                    Icon(Icons.payment)
                  ],
                )),
*/

