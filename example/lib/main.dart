import "package:flutter/material.dart";
import "package:localizex/localizex.dart";
import "localization/string_keys.dart";
import "localization/string_store.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize localization with fallback strings
  await AppStringLocalizations.initialize(strings: StringStore.stringsFallback);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  // Current app locale notifier
  ValueNotifier<Locale> locale = ValueNotifier<Locale>(const Locale("en"));

  // Animation controller for fade effects
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose(); // Dispose animation controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Rebuild MaterialApp when locale changes
    return ValueListenableBuilder<Locale>(
      valueListenable: locale,
      builder: (context, currentLocale, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            StringLocalizationsDelegate(),
            GlobalCupertinoLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          locale: currentLocale,
          supportedLocales: AppStringLocalizations.instance.strings.keys
              .map((langCode) => Locale.fromSubtags(languageCode: langCode))
              .toList(),
          title: StringKeys.appTitle.tr(),
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color(0xFF6366F1),
              brightness: Brightness.light,
            ),
            useMaterial3: true,
            fontFamily: "Roboto", // App font
          ),
          darkTheme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color(0xFF6366F1),
              brightness: Brightness.dark,
            ),
            useMaterial3: true,
            fontFamily: "Roboto",
          ),
          home: Builder(
            builder: (BuildContext context) {
              final theme = Theme.of(context);
              final colorScheme = theme.colorScheme;
              final isEnglish = currentLocale.languageCode == "en";

              return Scaffold(
                body: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        colorScheme.primary.withValues(alpha: 0.1),
                        colorScheme.secondary.withValues(alpha: 0.1),
                        colorScheme.tertiary.withValues(alpha: 0.05),
                      ],
                    ),
                  ),
                  child: SafeArea(
                    child: FadeTransition(
                      opacity: _fadeAnimation, // Fade animation
                      child: Center(
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              _buildWelcomeCard(colorScheme),
                              const SizedBox(height: 24),
                              _buildDescriptionCard(colorScheme),
                              const SizedBox(height: 32),
                              _buildLanguageSwitcher(isEnglish, colorScheme),
                              const SizedBox(height: 24),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  // Fetch translations for selected language
  Future<void> _translation(String langCode) async {
    Map<String, dynamic> localizationMap = {};

    // Example API payload for English
    if (langCode == "en") {
      localizationMap = {
        "translationData": {
          "appTitle": "Localizex Demo",
          "welcome": "Welcome to Localizex",
          "description":
              "A powerful Flutter localization package that makes managing multiple languages easy and efficient.",
          "changeLanguage": "Change Language",
          "selectLanguage": "Select your preferred language",
        },
      };
    }

    // Example API payload for Hindi
    if (langCode == "hi") {
      localizationMap = {
        "translationData": {
          "appTitle": "लोकलाइज़एक्स डेमो",
          "welcome": "लोकलाइज़एक्स में आपका स्वागत है",
          "description":
              "एक शक्तिशाली फ्लटर स्थानीयकरण पैकेज जो कई भाषाओं को प्रबंधित करना आसान और कुशल बनाता है।",
          "changeLanguage": "भाषा बदलें",
          "selectLanguage": "अपनी पसंदीदा भाषा चुनें",
        },
      };
    }

    // Convert dynamic map to Map<String, String>
    final Map<String, String> translationData =
        (localizationMap["translationData"] as Map<String, dynamic>).map(
          (key, value) => MapEntry(key, value.toString()),
        );

    // Ensure keys match fallback English keys
    final Map<String, String>? fallbackTranslations =
        StringStore.stringsFallback["en"];
    if (fallbackTranslations != null) {
      translationData.removeWhere(
        (key, _) => !fallbackTranslations.containsKey(key),
      );
      fallbackTranslations.forEach((key, value) {
        translationData.putIfAbsent(key, () => value);
      });
    }

    // Update global strings store
    StringStore.strings = {...StringStore.strings, langCode: translationData};

    await AppStringLocalizations.initialize(strings: StringStore.strings);
  }

  // Card with app title and welcome message
  Widget _buildWelcomeCard(ColorScheme colorScheme) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            colorScheme.primaryContainer,
            colorScheme.secondaryContainer,
          ],
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: colorScheme.primary.withValues(alpha: 0.2),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            StringKeys.appTitle.tr(),
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: colorScheme.onPrimaryContainer,
              height: 1.2,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            StringKeys.welcome.tr(),
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: colorScheme.onPrimaryContainer.withValues(alpha: 0.8),
              height: 1.3,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  // Card showing description
  Widget _buildDescriptionCard(ColorScheme colorScheme) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: colorScheme.outline.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: Text(
        StringKeys.description.tr(),
        style: TextStyle(
          fontSize: 16,
          height: 1.6,
          color: colorScheme.onSurface.withValues(alpha: 0.8),
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  // Language selection buttons
  Widget _buildLanguageSwitcher(bool isEnglish, ColorScheme colorScheme) {
    return Column(
      children: [
        Text(
          StringKeys.selectLanguage.tr(),
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: _buildLanguageButton(
                label: "English",
                flag: "🇬🇧",
                isSelected: isEnglish,
                onTap: () {
                  locale.value = const Locale("en");
                  _animationController.reset();
                  _animationController.forward();
                  _translation(locale.value.languageCode); // Update English
                },
                colorScheme: colorScheme,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildLanguageButton(
                label: "हिन्दी",
                flag: "🇮🇳",
                isSelected: !isEnglish,
                onTap: () {
                  locale.value = const Locale("hi");
                  _animationController.reset();
                  _animationController.forward();
                  _translation(locale.value.languageCode); // Update Hindi
                },
                colorScheme: colorScheme,
              ),
            ),
          ],
        ),
      ],
    );
  }

  // Individual language button
  Widget _buildLanguageButton({
    required String label,
    required String flag,
    required bool isSelected,
    required VoidCallback onTap,
    required ColorScheme colorScheme,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: isSelected ? null : onTap,
        borderRadius: BorderRadius.circular(16),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          decoration: BoxDecoration(
            gradient: isSelected
                ? LinearGradient(
                    colors: [
                      colorScheme.primary,
                      colorScheme.primary.withValues(alpha: 0.8),
                    ],
                  )
                : null,
            color: isSelected ? null : colorScheme.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isSelected
                  ? colorScheme.primary
                  : colorScheme.outline.withValues(alpha: 0.2),
              width: isSelected ? 2 : 1,
            ),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: colorScheme.primary.withValues(alpha: 0.3),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : null,
          ),
          child: Column(
            children: [
              Text(flag, style: const TextStyle(fontSize: 32)),
              const SizedBox(height: 8),
              Text(
                label,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: isSelected ? Colors.white : colorScheme.onSurface,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
