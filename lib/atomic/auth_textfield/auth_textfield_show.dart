import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:ready_to_use_widgets/atomic/auth_textfield/auth_textfield.dart';
import 'package:ready_to_use_widgets/atomic/auth_textfield/enum/auth_textfield_enum.dart';

class AuthTextFieldShow extends StatelessWidget {
  const AuthTextFieldShow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: context.horizontalPaddingNormal,
          child: const AuthTextField(
            textfieldType: AuthTextfieldTypeEnum.name,
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
