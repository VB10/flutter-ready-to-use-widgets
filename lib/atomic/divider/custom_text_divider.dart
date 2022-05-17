import 'package:flutter/material.dart';

class CustomTextDivider extends StatelessWidget {
  final String? text;
  final Color? dividerColor;
  final TextStyle? textStyle;
  const CustomTextDivider({Key? key, this.text, this.dividerColor, this.textStyle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          Expanded(child: getContainer),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text ?? "",
              style: textStyle,
            ),
          ),
          Expanded(
            child: getContainer,
          )
        ],
      ),
    );
  }

  Widget get getContainer =>
      Container(height: 1, decoration: BoxDecoration(border: Border.all(color: dividerColor ?? Colors.grey)));
}
