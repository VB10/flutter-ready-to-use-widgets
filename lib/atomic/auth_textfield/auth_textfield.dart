// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class AuthTextField extends StatefulWidget {
  const AuthTextField({
    Key? key,
    this.hintText,
    this.controller,
    this.prefixIcon,
    this.keyboardType,
    this.isNext,
  }) : super(key: key);

  final String? hintText;
  final TextEditingController? controller;
  final IconData? prefixIcon;
  final TextInputType? keyboardType;
  final bool? isNext;

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  bool? _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText =
        widget.keyboardType == TextInputType.visiblePassword ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: context.normalBorderRadius,
        boxShadow: const [
          BoxShadow(
            color: Color(0xFFBEBEBE),
            offset: Offset(10, 10),
            blurRadius: 30,
            spreadRadius: 1,
          ),
          BoxShadow(
            color: Colors.white,
            offset: Offset(-10, -10),
            blurRadius: 30,
            spreadRadius: 1,
          ),
        ],
      ),
      child: TextFormField(
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        obscureText: _obscureText!,
        textInputAction:
            widget.isNext == true ? TextInputAction.next : TextInputAction.done,
        textAlign: TextAlign.start,
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xffe9e9e9).withOpacity(0.9),
          hintText: widget.hintText,
          prefixIcon: Icon(
            widget.prefixIcon,
            color: Colors.black,
          ),
          suffixIcon: (_obscureText ?? false) ? _visibilityIcon() : null,
          border: OutlineInputBorder(
            borderRadius: context.normalBorderRadius,
            borderSide: BorderSide.none,
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Bu alan boş bırakılamaz";
          }
          if (widget.keyboardType == TextInputType.emailAddress) {
            if (RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
              return "Geçerli bir mail adresi giriniz";
            }
          }
          return null;
        },
      ),
    );
  }

  IconButton _visibilityIcon() {
    return IconButton(
      icon: _obscureText == false
          ? const Icon(Icons.visibility)
          : const Icon(Icons.visibility_off),
      onPressed: () {
        _changeVisibility();
      },
    );
  }

  void _changeVisibility() {
    return setState(() {
      _obscureText = !_obscureText!;
    });
  }
}
