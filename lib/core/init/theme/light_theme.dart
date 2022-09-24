import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ready_to_use_widgets/atomic/beauty_textfield/beauty_textfield.dart';
import 'package:ready_to_use_widgets/core/init/constants/color_constant.dart';
import 'package:ready_to_use_widgets/core/init/theme/base/base_theme.dart';

class LightTheme extends BaseTheme {
  static LightTheme? _instance;

  static LightTheme? get instance {
    if (_instance != null) return _instance;
    _instance = LightTheme._init();
    return _instance;
  }

  LightTheme._init();

  @override
  ThemeData get themeData => throw UnimplementedError();

  // Örnek olarak yapılmıştır.

  @override
  TextStyle get customSnackBar => GoogleFonts.ubuntu(
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: ColorConstants.dodgerBlue,
        ),
      );
}
