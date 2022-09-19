import 'package:flutter/cupertino.dart';
import 'package:ready_to_use_widgets/core/init/theme/base/base_theme.dart';
import 'package:ready_to_use_widgets/core/init/theme/enum/theme_enum.dart';

import 'package:shared_preferences/shared_preferences.dart';
import '../dark_theme.dart';
import '../light_theme.dart';

class ThemeViewModel with ChangeNotifier {
  static AppTheme _currentTheme = AppTheme.light;

  static BaseTheme? get theme => _currentTheme == AppTheme.light
      ? LightTheme.instance
      : DarkTheme.instance;

  AppTheme get currentTheme {
    return _currentTheme;
  }

  set currentTheme(AppTheme value) {
    _currentTheme = value;
    writeDataToPhone();
    notifyListeners();
  }

  Future<void> writeDataToPhone() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('appTheme', currentTheme.toString());
  }

  Future<AppTheme?> readDataToPhone() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('appTheme')?.stringToAppTheme;
  }
}
