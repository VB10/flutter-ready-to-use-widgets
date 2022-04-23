import 'package:flutter/material.dart';

// WIDGET DESCRIPTION
// It is a widget where you can set your button as you want and make new widgets for your own buttons.
// [Tr] Bu widget projenizde bulunan butonlar için hızlıca kullanabileceğiniz hatta bu widget üzerinden yeni butonlar oluşturabileceğiniz bir yapıdadır.
// Özel tasarımlar için style tarafında yapılacak tanımlamaları eklemeyi unutmayınız.

class CustomElevatedButton extends StatelessWidget {
  final Widget child;
  final Color color;
  final double height;
  final double width;
  final double borderRadius;
  final VoidCallback onPressed;

  const CustomElevatedButton(
      {Key? key,
      required this.color,
      required this.height,
      required this.width,
      required this.borderRadius,
      required this.onPressed,
      required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(color),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius),
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

