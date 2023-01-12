import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ready_to_use_widgets/core/init/constants/color_constant.dart';
import 'package:ready_to_use_widgets/core/init/extensions/context_extension.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key? key,
    required this.context,
    this.headerText = '',
    this.isOutlined = false,
    this.borderColor = ColorConstants.steelGray,
    this.showBorder = false,
    this.headerTextStyle,
    this.prefixIcon,
    this.inputFormatters,
    this.controller,
    this.keyboardType,
    this.hintText,
    this.validator,
    this.onSaved,
    this.textAlign,
    this.suffixIcon,
    this.autoValidateMode,
    this.obscureText,
    this.hintTextStyle,
    this.errorTextStyle,
    this.topPadding,
    this.enabled = true,
    this.focusNode,
    this.textStyle,
    this.initialValue,
  }) : super(key: key);

  final bool showBorder;
  final BuildContext context;
  final String headerText;
  final TextStyle? headerTextStyle;
  final bool? isOutlined;
  final Color? borderColor;
  final Widget? prefixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? hintText;
  final FormFieldValidator<String>? validator;
  final FormFieldSetter<String>? onSaved;
  final TextAlign? textAlign;
  final Widget? suffixIcon;
  final AutovalidateMode? autoValidateMode;
  final bool? obscureText;
  final TextStyle? hintTextStyle;
  final TextStyle? errorTextStyle;
  final double? topPadding;
  final bool enabled;
  final FocusNode? focusNode;
  final TextStyle? textStyle;
  final String? initialValue;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isVisible = false;

  void changeVisibility() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: widget.topPadding ?? context.dynamicHeight(0.015)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: context.dynamicHeight(0.007)),
            child: Text(
              widget.headerText,
              style: widget.headerTextStyle ??
                  context.appTheme().textFieldHeaderTextStyle,
            ),
          ),
          SizedBox(
            child: TextFormField(
              focusNode: widget.focusNode,
              initialValue: widget.initialValue,
              enabled: widget.enabled,
              validator: widget.validator,
              style: widget.textStyle ??
                  context.appTheme().textFieldHeaderTextStyle,
              textAlign: widget.textAlign ?? TextAlign.start,
              controller: widget.controller,
              inputFormatters: widget.inputFormatters,
              keyboardType: widget.keyboardType,
              obscureText: widget.obscureText ?? false,
              autovalidateMode: AutovalidateMode.disabled,
              decoration: InputDecoration(
                  disabledBorder: widget.showBorder
                      ? OutlineInputBorder(
                          borderSide:
                              BorderSide(color: widget.borderColor!, width: 1))
                      : const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: ColorConstants.steelGray, width: 1)),
                  hintText: widget.hintText,
                  hintStyle: widget.hintTextStyle ??
                      context.appTheme().textFieldHeaderTextStyle,
                  errorStyle: widget.errorTextStyle ??
                      context.appTheme().textFieldHeaderTextStyle,
                  prefixIcon: widget.prefixIcon,
                  suffixIcon: widget.suffixIcon,
                  enabledBorder: widget.showBorder
                      ? OutlineInputBorder(
                          borderSide:
                              BorderSide(color: widget.borderColor!, width: 1))
                      : const OutlineInputBorder(
                          borderSide: BorderSide(
                              color: ColorConstants.steelGray, width: 1)),
                  focusColor: ColorConstants.steelGray,
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: ColorConstants.steelGray)),
                  border: const OutlineInputBorder(),
                  filled: true,
                  fillColor: ((widget.isOutlined ?? false) &&
                          widget.borderColor == null)
                      ? ColorConstants.steelGray
                      : (widget.isOutlined ?? false) &&
                              widget.borderColor != null
                          ? widget.borderColor
                          : ColorConstants.white),
              onSaved: widget.onSaved,
            ),
          ),
        ],
      ),
    );
  }
}
