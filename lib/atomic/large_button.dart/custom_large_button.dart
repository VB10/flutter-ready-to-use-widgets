import 'package:flutter/material.dart';
import 'package:ready_to_use_widgets/core/init/constants/color_constant.dart';

class LargeButton extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final Color? backgroundColor;
  final double radius;
  final bool isOutlined;
  final VoidCallback? onPressed;
  final double borderWidth;
  final Color? borderColor;
  const LargeButton({
    Key? key,
    required this.text,
    this.style,
    this.backgroundColor,
    this.radius = 8,
    this.isOutlined = false,
    this.onPressed,
    this.borderWidth = 0.8,
    this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        side: BorderSide(
            width: onPressed == null ? 0 : borderWidth,
            color: (isOutlined && borderColor == null
                ? ColorConstants.white
                : isOutlined && borderColor != null
                    ? borderColor
                    : ColorConstants.steelGray)!),
        backgroundColor: isOutlined ? backgroundColor : ColorConstants.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
      child: Text(
        text,
        style: style,
      ),
    );
  }
}
