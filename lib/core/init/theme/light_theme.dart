import 'package:flutter/material.dart';
import 'package:ready_to_use_widgets/core/theme/base/base_theme.dart';

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
}
