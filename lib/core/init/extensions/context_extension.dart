import 'package:flutter/cupertino.dart';
import 'package:ready_to_use_widgets/core/init/theme/base/base_theme.dart';
import '../theme/viewmodel/theme_viewmodel.dart';

extension ContextExtension on BuildContext {
  double dynamicHeight(double value) => MediaQuery.of(this).size.height * value;
  double dynamicWidth(double value) => MediaQuery.of(this).size.width * value;
  BaseTheme appTheme() => ThemeViewModel.theme!;
}
