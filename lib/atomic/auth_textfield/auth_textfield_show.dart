import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:ready_to_use_widgets/atomic/auth_textfield/auth_textfield.dart';

class AuthTextFieldShow extends StatelessWidget {
  const AuthTextFieldShow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: context.horizontalPaddingNormal,
          child: const AuthTextField(
            hintText: "Oguz",
            isNext: true,
            keyboardType: TextInputType.name,
            prefixIcon: Icons.person,
          ),
        ),
      ),
    );
  }
}
