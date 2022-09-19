import 'package:flutter/material.dart';
import 'package:ready_to_use_widgets/core/theme/base/base_theme.dart';

class DarkTheme extends BaseTheme {
  static DarkTheme? _instance;

  static DarkTheme? get instance {
    if (_instance != null) return _instance;
    _instance = DarkTheme._init();
    return _instance;
  }

  DarkTheme._init();

  @override
  ThemeData get themeData => throw UnimplementedError();

 
}
