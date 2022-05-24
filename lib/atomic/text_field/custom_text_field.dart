import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.labelText,
    this.obscureText = false,
    this.icon,
    this.inputType,
    this.focusNode,
    this.enabledBorderColor = Colors.grey,
    this.enabledBorderRadius = 20,
    this.enabledBorderWidth = 1,
    this.focusedBorderColor = Colors.blue,
    this.focusedBorderRadius = 10,
    this.focusedBorderWidth = 2,
    this.padding = 12,
    this.nextFocusNode,
  }) : super(key: key);

  final TextEditingController controller;
  final String labelText;
  final bool obscureText;
  final TextInputType? inputType;
  final IconData? icon;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final Color enabledBorderColor;
  final double enabledBorderRadius;
  final double enabledBorderWidth;
  final Color focusedBorderColor;
  final double focusedBorderRadius;
  final double focusedBorderWidth;
  final double padding;

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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widget.padding, vertical: widget.padding / 2),
      child: TextField(
        focusNode: widget.focusNode,
        controller: widget.controller,
        obscureText: _isVisible ? false : widget.obscureText,
        keyboardType: widget.inputType,
        onEditingComplete: widget.nextFocusNode != null ? () => widget.nextFocusNode!.requestFocus() : null,
        decoration: InputDecoration(
          suffix: widget.obscureText
              ? InkWell(
                  child: _isVisible
                      ? Icon(
                          Icons.remove_red_eye,
                          color: Theme.of(context).primaryColor,
                        )
                      : Icon(
                          Icons.remove_red_eye_outlined,
                          color: Theme.of(context).primaryColor,
                        ),
                  onTap: () {
                    changeVisibility();
                  },
                )
              : null,
          prefixIcon: Icon(widget.icon),
          labelText: widget.labelText,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: widget.enabledBorderColor,
              width: widget.enabledBorderWidth,
            ),
            borderRadius: BorderRadius.circular(widget.enabledBorderRadius),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: widget.focusedBorderColor,
              width: widget.focusedBorderWidth,
            ),
            borderRadius: BorderRadius.circular(widget.focusedBorderRadius),
          ),
        ),
      ),
    );
  }
}
