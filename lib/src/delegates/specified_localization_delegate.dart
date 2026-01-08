import 'app_string_localizations.dart';
import 'package:flutter/material.dart';

import 'string_localizations_delegate.dart';

/// A localization delegate that overrides the locale with a specified one.
class SpecifiedLocalizationDelegate
    extends LocalizationsDelegate<AppStringLocalizations> {
  /// The locale to be used.
  final Locale overriddenLocale;

  /// Creates a new instance of [SpecifiedLocalizationDelegate] with the given [overriddenLocale].
  const SpecifiedLocalizationDelegate(this.overriddenLocale);

  @override
  bool isSupported(Locale locale) => true;

  @override
  Future<AppStringLocalizations> load(Locale locale) =>
      const StringLocalizationsDelegate().load(overriddenLocale);

  @override
  bool shouldReload(SpecifiedLocalizationDelegate old) => true;
}
