import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

/// A helper class to manage string localizations.
///
/// This class handles loading and retrieving localized strings based on the current locale.
class AppStringLocalizations {
  /// The current locale.
  Locale locale = const Locale.fromSubtags(languageCode: "en");

  /// Creates a new instance of [AppStringLocalizations].
  AppStringLocalizations();

  static AppStringLocalizations? _instance;

  /// The singleton instance of [AppStringLocalizations].
  static AppStringLocalizations get instance =>
      _instance ??= AppStringLocalizations();

  static Map<String, Map<String, String>>? _strings;

  // Fetch strings (non-nullable)
  /// Returns the map of localized strings.
  Map<String, Map<String, String>> get strings => _strings ?? {};

  /// Initializes the localized strings map.
  static Future<void> initialize({
    required Map<String, Map<String, String>> strings,
  }) async {
    _strings = strings;
  }

  /// Loads the strings for the specified [locale].
  static Future<AppStringLocalizations> load(Locale locale) {
    instance.locale = locale;
    final String name = locale.countryCode?.isEmpty ?? true
        ? locale.languageCode
        : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    Intl.defaultLocale = localeName;
    return SynchronousFuture<AppStringLocalizations>(instance);
  }

  /// Returns the [AppStringLocalizations] instance for the given [context].
  static AppStringLocalizations of(BuildContext context) {
    return Localizations.of<AppStringLocalizations>(
      context,
      AppStringLocalizations,
    )!;
  }

  /// Retrieves the localized string for the given [resId].
  String getString(String resId) {
    return strings[locale.languageCode]?[resId] ??
        strings["en"]?[resId] ??
        "$resId not found";
  }

  /// Checks if the given [languageCode] is supported.
  static bool isSupported(String languageCode) {
    return instance.strings.containsKey(languageCode);
  }
}
