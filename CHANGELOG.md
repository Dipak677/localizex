## 1.0.0

- Initial release of localizex package.
- Core localization features:
  - `AppStringLocalizations` - Manages localized strings with singleton pattern.
  - `StringLocalizationsDelegate` - Delegate for Flutter's localization system.
  - `SpecifiedLocalizationDelegate` - Allows overriding locale for specific use cases.
  - `LocalizationExtension` - Convenient `.tr()` extension method on String.
  - `LanguageLocale` - Utility class with 80+ language codes and metadata.
- Features:
  - Dynamic locale switching support.
  - Automatic fallback to English for missing translations.
  - Type-safe string retrieval with `getString()`.
  - Comprehensive language metadata (flags, native names, English names).
- Full public API documentation.
- Comprehensive test coverage with 11 passing unit tests.
