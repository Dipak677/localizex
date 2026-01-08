class StringStore {
  StringStore._();

  static const Map<String, Map<String, String>> stringsFallback = {
    "en": {
      "appTitle": "Localizex Demo",
      "welcome": "Welcome to Localizex",
      "description":
          "A powerful Flutter localization package that makes managing multiple languages easy and efficient.",
      "changeLanguage": "Change Language",
      "selectLanguage": "Select your preferred language",
    },
    "hi": {
      "appTitle": "लोकलाइज़एक्स डेमो",
      "welcome": "लोकलाइज़एक्स में आपका स्वागत है",
      "description":
          "एक शक्तिशाली फ्लटर स्थानीयकरण पैकेज जो कई भाषाओं को प्रबंधित करना आसान और कुशल बनाता है।",
      "changeLanguage": "भाषा बदलें",
      "selectLanguage": "अपनी पसंदीदा भाषा चुनें",
    },
  };

  static Map<String, Map<String, String>> strings = stringsFallback;
}
