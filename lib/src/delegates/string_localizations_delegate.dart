import 'app_string_localizations.dart';
import 'package:flutter/material.dart';

/// A localization delegate for [AppStringLocalizations].
class StringLocalizationsDelegate
    extends LocalizationsDelegate<AppStringLocalizations> {
  /// Creates a new instance of [StringLocalizationsDelegate].
  const StringLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      AppStringLocalizations.isSupported(locale.languageCode);

  @override
  Future<AppStringLocalizations> load(Locale locale) {
    return AppStringLocalizations.load(locale);
  }

  @override
  bool shouldReload(StringLocalizationsDelegate old) => false;
}
