import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
  TextStyle get itemCardWidgetTextStyle => GoogleFonts.ubuntu(
        textStyle: const TextStyle(
            color: ColorConstants.white,
            fontSize: 14,
            fontWeight: FontWeight.w600),
      );
  @override
  TextStyle get wideExpansionPanelTextStyle => GoogleFonts.ubuntu(
        textStyle: const TextStyle(
            color: ColorConstants.black,
            fontSize: 14,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold),
      );
}
