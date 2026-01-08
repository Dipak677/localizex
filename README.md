# localizex

A lightweight and efficient Flutter package for managing application localization with support for dynamic locale switching and easy string retrieval.

## Features

- **Simple Integration**: Easy to set up and use with minimal boilerplate code
- **Dynamic Locale Switching**: Change app language at runtime without restart
- **Automatic Fallback**: Falls back to English for missing translations
- **Type-Safe**: Retrieve localized strings with compile-time safety
- **Extension Method**: Convenient `.tr()` extension on String for quick translations
- **80+ Languages**: Built-in support for 80+ ISO language codes with metadata
- **Language Metadata**: Access language flags, native names, and English names
- **Singleton Pattern**: Efficient memory usage with singleton instance

## Installation

Add `localizex` to your `pubspec.yaml`:

```yaml
dependencies:
  localizex: ^1.0.0
```

Then run:

```bash
flutter pub get
```

## Quick Start

```dart
import 'package:localizex/localizex.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 1. Initialize with your strings
  await AppStringLocalizations.initialize(
    strings: {
      "en": {"hello": "Hello", "welcome": "Welcome"},
      "hi": {"hello": "नमस्ते", "welcome": "स्वागत है"},
    },
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 2. Add delegates
      localizationsDelegates: [
        StringLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      // 3. Define supported locales
      supportedLocales: [Locale("en"), Locale("hi")],
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 4. Use translations
    return Scaffold(
      body: Center(child: Text("hello".tr())),
    );
  }
}
```

## Usage

### Translation Methods

**Extension Method (Recommended)**

The simplest way to translate strings:

```dart
Text("hello".tr())  // Returns "Hello" or "नमस्ते" based on current locale
```

**Using getString()**

Direct method call:

```dart
Text(AppStringLocalizations.instance.getString("hello"))
```

**Using of(context)**

Get instance from BuildContext:

```dart
Text(AppStringLocalizations.of(context).getString("welcome"))
```

### Dynamic Locale Switching

Change language at runtime:

```dart
ElevatedButton(
  onPressed: () {
    setState(() {
      AppStringLocalizations.load(Locale("hi"));
    });
  },
  child: Text("Switch to Hindi"),
)
```

### Language Metadata

Access language information:

```dart
// Get language details
var language = LanguageLocale.getDisplayLanguage("hi");
print(language["EnglishName"]);  // "हिंदी (Hindi)"
print(language["Flag"]);          // "🇮🇳"
print(language["NativeName"]);    // "हिन्दी"

// Get just the English name
String name = LanguageLocale.getDisplayLanguageName("en");
print(name);  // "English"
```

## Advanced Usage

### Type-Safe String Keys (Recommended for Large Apps)

For better type safety and IDE autocomplete, use the StringKeys pattern demonstrated in the example app.

**How it works:**

1. **StringStore** - Centralized string storage
2. **StringKeys** - Auto-generated constants
3. **generate_string_keys.sh** - Script to generate StringKeys

**StringStore** (`example/lib/localization/string_store.dart`)

Centralized storage for all localization strings:

```dart
class StringStore {
  static const Map<String, Map<String, String>> stringsFallback = {
    "en": {
      "appTitle": "Localizex Demo",
      "welcome": "Welcome to Localizex",
    },
    "hi": {
      "appTitle": "लोकलाइज़एक्स डेमो",
      "welcome": "लोकलाइज़एक्स में आपका स्वागत है",
    },
  };

  static Map<String, Map<String, String>> strings = stringsFallback;
}
```

**StringKeys** (Auto-generated)

Type-safe constants for all translation keys:

```dart
// GENERATED FILE — DO NOT MODIFY MANUALLY
class StringKeys {
  static const String appTitle = "appTitle";
  static const String welcome = "welcome";
}
```

**Usage with StringKeys:**

```dart
Text(StringKeys.welcome.tr())  // ✅ Type-safe, autocomplete enabled
Text("welcome".tr())            // ⚠️ Works but prone to typos
```

**Benefits:**

- ✅ **Compile-time safety** - Catch typos before runtime
- ✅ **IDE autocomplete** - See all available keys
- ✅ **Refactoring support** - Rename keys safely
- ✅ **Single source of truth** - All keys in one place

**Generating StringKeys:**

Run the provided script to auto-generate StringKeys from StringStore:

```bash
cd example/script
chmod +x generate_string_keys.sh  # First time only
./generate_string_keys.sh
```

The script extracts all keys from the English locale and generates the StringKeys class automatically.

### Custom Locale Override

Force a specific locale using `SpecifiedLocalizationDelegate`:

```dart
MaterialApp(
  localizationsDelegates: [
    SpecifiedLocalizationDelegate(Locale("hi")),
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ],
  // ...
)
```

### Check Locale Support

Verify if a language code is supported:

```dart
bool isSupported = AppStringLocalizations.isSupported("hi");
print(isSupported);  // true
```

## Example App

Check out the [example app](example/lib/main.dart) for a complete demo featuring:

- ✅ Dynamic locale switching between English and Hindi
- ✅ Beautiful Material Design 3 UI with animations
- ✅ Type-safe StringKeys implementation
- ✅ Language metadata display

Run the example:

```bash
cd example
flutter run
```

## Supported Languages

The package includes metadata for **80+ languages** including:

English, Hindi, Spanish, French, German, Chinese, Japanese, Korean, Arabic, Russian, Portuguese, Italian, Dutch, Turkish, Vietnamese, Thai, Indonesian, Polish, Czech, Swedish, Norwegian, Danish, Finnish, Greek, Hebrew, and many more.

## API Reference

### AppStringLocalizations

| Method                                                            | Description                    |
| ----------------------------------------------------------------- | ------------------------------ |
| `initialize({required Map<String, Map<String, String>> strings})` | Initialize localized strings   |
| `load(Locale locale)`                                             | Load a specific locale         |
| `of(BuildContext context)`                                        | Get instance from context      |
| `getString(String resId)`                                         | Get localized string for a key |
| `isSupported(String languageCode)`                                | Check if language is supported |
| `instance`                                                        | Get singleton instance         |

### LanguageLocale

| Method                               | Description                                                    |
| ------------------------------------ | -------------------------------------------------------------- |
| `getDisplayLanguage(String key)`     | Get language details map (Code, EnglishName, NativeName, Flag) |
| `getDisplayLanguageName(String key)` | Get English name of language                                   |
| `isoLangs`                           | List of all supported language metadata                        |

### LocalizationExtension

| Method        | Description                                  |
| ------------- | -------------------------------------------- |
| `String.tr()` | Extension method to translate current string |

## Additional Information

**License**: This package is released under the MIT License. See [LICENSE](LICENSE) file for details.

---

Made with ❤️ for the Flutter community
# localizex
