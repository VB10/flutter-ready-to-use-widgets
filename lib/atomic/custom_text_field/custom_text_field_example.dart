import 'package:flutter/material.dart';
import 'package:ready_to_use_widgets/atomic/large_button.dart/custom_large_button.dart';
import 'package:ready_to_use_widgets/core/init/constants/color_constant.dart';
import 'package:ready_to_use_widgets/core/init/extensions/context_extension.dart';
import 'package:ready_to_use_widgets/atomic/custom_text_field/custom_text_field.dart';

class TextFieldExample extends StatelessWidget {
  const TextFieldExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Custom Text Field Example'),
          backgroundColor: ColorConstants.blueGray),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          buildEmailTextField(context),
          buildPasswordTextField(context),
          buildDoubleLargeButton(context)
        ]),
      ),
    );
  }

  Widget buildEmailTextField(BuildContext context) {
    return CustomTextField(
      context: context,
      headerText: 'Email',
      headerTextStyle: context.appTheme().textFieldHeaderTextStyle,
      suffixIcon: const Icon(Icons.email),
    );
  }

  Widget buildPasswordTextField(BuildContext context) {
    return CustomTextField(
      context: context,
      suffixIcon: const Icon(Icons.admin_panel_settings_rounded),
      headerText: 'Password',
      headerTextStyle: context.appTheme().textFieldHeaderTextStyle,
      obscureText: true,
      topPadding: context.dynamicHeight(0.03),
    );
  }

  Widget buildDoubleLargeButton(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: context.dynamicHeight(0.03)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            LargeButton(
              text: 'Giriş Yap',
              onPressed: () {},
              style: context.appTheme().itemCardWidgetTextStyle,
              backgroundColor: ColorConstants.blueGray,
              isOutlined: true,
            ),
            LargeButton(
              text: 'Kayıt Ol',
              onPressed: () {},
              backgroundColor: ColorConstants.blueGray,
              isOutlined: true,
              style: context.appTheme().itemCardWidgetTextStyle,
            )
          ],
        ));
  }
}
