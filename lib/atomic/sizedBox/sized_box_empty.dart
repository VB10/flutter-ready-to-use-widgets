import 'package:flutter/material.dart';

class SizedBoxEmpty extends StatelessWidget {
  const SizedBoxEmpty({Key? key}) : super(key: key); //Boş kutu

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 0,
      width: 0,
    );
  }
}
