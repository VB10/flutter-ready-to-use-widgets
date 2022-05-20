import 'package:flutter/material.dart';

class CustomPasswordTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final String? Function(String?)? validator;
  final InputBorder? border;
  final InputBorder? focusedBorder;
  final InputBorder? errorBorder;
  final VoidCallback? onTap;
  final Function(String)? onChanged;
  const CustomPasswordTextField(
      {Key? key,
      this.controller,
      this.labelText,
      this.validator,
      this.hintText,
      this.border,
      this.onTap,
      this.onChanged,
      this.focusedBorder,
      this.errorBorder})
      : super(key: key);

  @override
  _CustomPasswordTextFiedlState createState() => _CustomPasswordTextFiedlState();
}

class _CustomPasswordTextFiedlState extends State<CustomPasswordTextField> {
  bool _passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      controller: widget.controller,
      obscureText: _passwordVisible,
      onTap: widget.onTap,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        labelText: widget.labelText,
        hintText: widget.hintText,
        border: widget.border ?? const OutlineInputBorder(),
        errorBorder: widget.errorBorder,
        focusedBorder: widget.focusedBorder,
        suffixIcon: IconButton(
            icon: Icon(
              _passwordVisible ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: () {
              setState(() {
                _passwordVisible = !_passwordVisible;
              });
            }),
      ),
    );
  }
}
