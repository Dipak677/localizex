import '../delegates/app_string_localizations.dart';

/// Extension on [String] to provide easy localization.
extension LocalizationExtension on String {
  /// Translates the string using [AppStringLocalizations].
  String tr() {
    return AppStringLocalizations.instance.getString(this);
  }
}
