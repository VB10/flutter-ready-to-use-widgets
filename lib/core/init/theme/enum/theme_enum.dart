enum AppTheme { dark, light }

extension AppThemeExtension on AppTheme {
  String get appThemeToString {
    switch (this) {
      case AppTheme.dark:
        return 'AppTheme.DARK';
      case AppTheme.light:
        return 'AppTheme.LIGHT';
      default:
        {
          return 'AppTheme.LIGHT';
        }
    }
  }
}

extension AppThemeStringExtension on String {
  AppTheme get stringToAppTheme {
    switch (this) {
      case 'AppTheme.DARK':
        return AppTheme.dark;
      case 'AppTheme.LIGHT':
        return AppTheme.light;
      default:
        {
          return AppTheme.light;
        }
    }
  }
}
