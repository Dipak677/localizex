/// A utility class for handling language and locale information.
class LanguageLocale {
  /// A list of supported ISO languages with their details.
  static final isoLangs = [
    {
      "Code": "en",
      "EnglishName": "English",
      "NativeName": "English",
      "Flag": "🇺🇸",
    },
    {
      "Code": "ar",
      "EnglishName": "(Arabic) العربية",
      "NativeName": "العربية",
      "Flag": "🇰🇼",
    },
    {
      "Code": "hi",
      "EnglishName": "हिंदी (Hindi)",
      "NativeName": "हिन्दी",
      "Flag": "🇮🇳",
    },
    {
      "Code": "bn",
      "EnglishName": "বাংলা (Bangla)",
      "NativeName": "বাংলা",
      "Flag": "🇧🇩",
    },
    {
      "Code": "tl",
      "EnglishName": "Filipino",
      "NativeName": "Filipino",
      "Flag": "🇵🇭",
    },
    {
      "Code": "af",
      "EnglishName": "Afrikaans",
      "NativeName": "Afrikaans",
      "Flag": "🇿🇦",
    },
    {
      "Code": "sq",
      "EnglishName": "Albanian",
      "NativeName": "Shqip",
      "Flag": "🇦🇱",
    },
    {
      "Code": "am",
      "EnglishName": "Amharic",
      "NativeName": "አማርኛ",
      "Flag": "🇪🇹",
    },
    {
      "Code": "en-AU",
      "EnglishName": "English",
      "NativeName": "English (Australia)",
      "Flag": "🇦🇺",
    },
    {
      "Code": "en-CA",
      "EnglishName": "English",
      "NativeName": "English (Canada)",
      "Flag": "🇨🇦",
    },
    {
      "Code": "en-GB",
      "EnglishName": "English",
      "NativeName": "English (United Kingdom)",
      "Flag": "🇬🇧",
    },
    {
      "Code": "hy",
      "EnglishName": "Armenian",
      "NativeName": "Հայերեն",
      "Flag": "🇦🇲",
    },
    {
      "Code": "my",
      "EnglishName": "Burmese",
      "NativeName": "ဗမာ",
      "Flag": "🇲🇲",
    },
    {
      "Code": "eu",
      "EnglishName": "Basque",
      "NativeName": "Euskara",
      "Flag": "🇪🇸",
    },
    {
      "Code": "bg",
      "EnglishName": "Bulgarian",
      "NativeName": "Български",
      "Flag": "🇧🇬",
    },
    {
      "Code": "be",
      "EnglishName": "Belarusian",
      "NativeName": "Беларуская",
      "Flag": "🇧🇾",
    },
    {
      "Code": "hr",
      "EnglishName": "Croatian",
      "NativeName": "Hrvatski",
      "Flag": "🇭🇷",
    },
    {
      "Code": "da",
      "EnglishName": "Danish",
      "NativeName": "Dansk",
      "Flag": "🇩🇰",
    },
    {
      "Code": "et",
      "EnglishName": "Estonian",
      "NativeName": "Eesti",
      "Flag": "🇪🇪",
    },
    {
      "Code": "fi",
      "EnglishName": "Finnish",
      "NativeName": "Suomi",
      "Flag": "🇫🇮",
    },
    {
      "Code": "fr-FR",
      "EnglishName": "French",
      "NativeName": "Français (France)",
      "Flag": "🇫🇷",
    },
    {
      "Code": "fr-CA",
      "EnglishName": "French",
      "NativeName": "Français (Canada)",
      "Flag": "🇨🇦",
    },
    {
      "Code": "gl",
      "EnglishName": "Galician",
      "NativeName": "Galego",
      "Flag": "🇪🇸",
    },
    {
      "Code": "ka",
      "EnglishName": "Georgian",
      "NativeName": "ქართული",
      "Flag": "🇬🇪",
    },
    {
      "Code": "gu",
      "EnglishName": "Gujarati",
      "NativeName": "ગુજરાતી",
      "Flag": "🇮🇳",
    },
    {
      "Code": "he",
      "EnglishName": "Hebrew",
      "NativeName": "עברית",
      "Flag": "🇮🇱",
    },
    {
      "Code": "id",
      "EnglishName": "Indonesian",
      "NativeName": "Indonesia",
      "Flag": "🇮🇩",
    },
    {
      "Code": "is",
      "EnglishName": "Icelandic",
      "NativeName": "Íslenska",
      "Flag": "🇮🇸",
    },
    {
      "Code": "it",
      "EnglishName": "Italian",
      "NativeName": "Italiano",
      "Flag": "🇮🇹",
    },
    {
      "Code": "ja",
      "EnglishName": "Japanese",
      "NativeName": "日本語",
      "Flag": "🇯🇵",
    },
    {
      "Code": "kn",
      "EnglishName": "Kannada",
      "NativeName": "ಕನ್ನಡ",
      "Flag": "🇮🇳",
    },
    {
      "Code": "ca",
      "EnglishName": "Catalan",
      "NativeName": "Català",
      "Flag": "🇪🇸",
    },
    {
      "Code": "kk",
      "EnglishName": "Kazakh",
      "NativeName": "Қазақ тілі",
      "Flag": "🇰🇿",
    },
    {
      "Code": "km",
      "EnglishName": "Khmer",
      "NativeName": "ខ្មែរ",
      "Flag": "🇰🇭",
    },
    {
      "Code": "ko",
      "EnglishName": "Korean",
      "NativeName": "한국어",
      "Flag": "🇰🇷",
    },
    {
      "Code": "ky",
      "EnglishName": "Kyrgyz",
      "NativeName": "Кыргызча",
      "Flag": "🇰🇬",
    },
    {"Code": "lo", "EnglishName": "Lao", "NativeName": "ລາວ", "Flag": "🇱🇦"},
    {
      "Code": "lt",
      "EnglishName": "Lithuanian",
      "NativeName": "Lietuvių",
      "Flag": "🇱🇹",
    },
    {
      "Code": "lv",
      "EnglishName": "Latvian",
      "NativeName": "Latviešu",
      "Flag": "🇱🇻",
    },
    {
      "Code": "mk",
      "EnglishName": "Macedonian",
      "NativeName": "Македонски",
      "Flag": "🇲🇰",
    },
    {
      "Code": "ml",
      "EnglishName": "Malayalam",
      "NativeName": "മലയാളം",
      "Flag": "🇮🇳",
    },
    {
      "Code": "ms-MY",
      "EnglishName": "Malay (Malaysia)",
      "NativeName": "Bahasa Melayu (Malaysia)",
      "Flag": "🇲🇾",
    },
    {
      "Code": "ms",
      "EnglishName": "Malay",
      "NativeName": "Bahasa Melayu",
      "Flag": "🇲🇾",
    },
    {
      "Code": "mr",
      "EnglishName": "Marathi",
      "NativeName": "मराठी",
      "Flag": "🇮🇳",
    },
    {
      "Code": "hu",
      "EnglishName": "Hungarian",
      "NativeName": "Magyar",
      "Flag": "🇭🇺",
    },
    {
      "Code": "mn",
      "EnglishName": "Mongolian",
      "NativeName": "Монгол",
      "Flag": "🇲🇳",
    },
    {
      "Code": "ne",
      "EnglishName": "Nepali",
      "NativeName": "नेपाली",
      "Flag": "🇳🇵",
    },
    {
      "Code": "nl",
      "EnglishName": "Dutch",
      "NativeName": "Nederlands",
      "Flag": "🇳🇱",
    },
    {
      "Code": "no",
      "EnglishName": "Norwegian",
      "NativeName": "Norsk",
      "Flag": "🇳🇴",
    },
    {
      "Code": "de",
      "EnglishName": "German",
      "NativeName": "Deutsch",
      "Flag": "🇩🇪",
    },
    {
      "Code": "pa",
      "EnglishName": "Punjabi",
      "NativeName": "ਪੰਜਾਬੀ",
      "Flag": "🇮🇳",
    },
    {
      "Code": "fa",
      "EnglishName": "Persian",
      "NativeName": "فارسی",
      "Flag": "🇮🇷",
    },
    {
      "Code": "pl",
      "EnglishName": "Polish",
      "NativeName": "Polski",
      "Flag": "🇵🇱",
    },
    {
      "Code": "pt-BR",
      "EnglishName": "Portuguese (Brazil)",
      "NativeName": "Português (Brasil)",
      "Flag": "🇧🇷",
    },
    {
      "Code": "pt-PT",
      "EnglishName": "Portuguese (Portugal)",
      "NativeName": "Português (Portugal)",
      "Flag": "🇵🇹",
    },
    {
      "Code": "ro",
      "EnglishName": "Romanian",
      "NativeName": "Română",
      "Flag": "🇷🇴",
    },
    {
      "Code": "ru",
      "EnglishName": "Russian",
      "NativeName": "Русский",
      "Flag": "🇷🇺",
    },
    {
      "Code": "rm",
      "EnglishName": "Romansh",
      "NativeName": "Rumantsch",
      "Flag": "🇨🇭",
    },
    {
      "Code": "si",
      "EnglishName": "Sinhala",
      "NativeName": "සිංහල",
      "Flag": "🇱🇰",
    },
    {
      "Code": "sk",
      "EnglishName": "Slovak",
      "NativeName": "Slovenčina",
      "Flag": "🇸🇰",
    },
    {
      "Code": "sl",
      "EnglishName": "Slovenian",
      "NativeName": "Slovenščina",
      "Flag": "🇸🇮",
    },
    {
      "Code": "sr",
      "EnglishName": "Serbian",
      "NativeName": "Српски",
      "Flag": "🇷🇸",
    },
    {
      "Code": "sw",
      "EnglishName": "Swahili",
      "NativeName": "Kiswahili",
      "Flag": "🇹🇿",
    },
    {
      "Code": "ta",
      "EnglishName": "Tamil",
      "NativeName": "தமிழ்",
      "Flag": "🇮🇳",
    },
    {
      "Code": "te",
      "EnglishName": "Telugu",
      "NativeName": "తెలుగు",
      "Flag": "🇮🇳",
    },
    {"Code": "th", "EnglishName": "Thai", "NativeName": "ไทย", "Flag": "🇹🇭"},
    {
      "Code": "tr",
      "EnglishName": "Turkish",
      "NativeName": "Türkçe",
      "Flag": "🇹🇷",
    },
    {
      "Code": "uk",
      "EnglishName": "Ukrainian",
      "NativeName": "Українська",
      "Flag": "🇺🇦",
    },
    {"Code": "ur", "EnglishName": "Urdu", "NativeName": "اردو", "Flag": "🇵🇰"},
    {
      "Code": "vi",
      "EnglishName": "Vietnamese",
      "NativeName": "Tiếng Việt",
      "Flag": "🇻🇳",
    },
    {"Code": "zu", "EnglishName": "Zulu", "NativeName": "Zulu", "Flag": "🇿🇦"},
    {
      "Code": "az",
      "EnglishName": "Azerbaijani",
      "NativeName": "Azərbaycan dili",
      "Flag": "🇦🇿",
    },
    {
      "Code": "cs",
      "EnglishName": "Czech",
      "NativeName": "Čeština",
      "Flag": "🇨🇿",
    },
    {
      "Code": "zh-HK",
      "EnglishName": "Chinese (Hong Kong)",
      "NativeName": "中文（香港）",
      "Flag": "🇭🇰",
    },
    {
      "Code": "zh-TW",
      "EnglishName": "Chinese (Traditional)",
      "NativeName": "中文（繁體）",
      "Flag": "🇹🇼",
    },
    {
      "Code": "zh",
      "EnglishName": "Chinese (Simplified)",
      "NativeName": "中文（简体）",
      "Flag": "🇨🇳",
    },
    {
      "Code": "el",
      "EnglishName": "Greek",
      "NativeName": "Ελληνικά",
      "Flag": "🇬🇷",
    },
    {
      "Code": "es-419",
      "EnglishName": "Spanish (Latin America)",
      "NativeName": "Español (Latinoamérica)",
      "Flag": "🌎",
    },
    {
      "Code": "es-US",
      "EnglishName": "Spanish (United States)",
      "NativeName": "Español (Estados Unidos)",
      "Flag": "🇺🇸",
    },
    {
      "Code": "es",
      "EnglishName": "Spanish (Spain)",
      "NativeName": "Español (España)",
      "Flag": "🇪🇸",
    },
    {
      "Code": "sv",
      "EnglishName": "Swedish",
      "NativeName": "Svenska",
      "Flag": "🇸🇪",
    },
  ];

  /// Retrieves the display language details for the given language [key].
  ///
  /// Throws an [Exception] if the key is incorrect.
  static Map<String, String> getDisplayLanguage(String key) {
    for (Map<String, String> x in isoLangs) {
      if (key.toLowerCase().contains(x["Code"]!.toLowerCase())) {
        return x;
      }
    }
    throw Exception("Language key incorrect");
  }

  /// Retrieves the English name of the display language for the given language [key].
  ///
  /// Throws an [Exception] if the key is incorrect.
  static String getDisplayLanguageName(String key) {
    for (Map<String, String> x in isoLangs) {
      if (key.toLowerCase().contains(x["Code"]!.toLowerCase())) {
        return x["EnglishName"] ?? "";
      }
    }
    throw Exception("Language key incorrect");
  }
}
