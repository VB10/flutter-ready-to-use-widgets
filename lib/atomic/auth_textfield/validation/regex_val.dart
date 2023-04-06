class RegexValidations {
  static RegexValidations? _instace;
  static RegexValidations get instance {
    _instace ??= RegexValidations._init();
    return _instace!;
  }

  RegexValidations._init();

  RegExp get emailRegex => RegExp(r'\S+@\S+\.\S+');
}
