import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:motivational_app/l10n/app_localizations.dart';
import 'package:motivational_app/pages/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _preferredLocaleKey = 'preferred_locale_code';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final preferences = await SharedPreferences.getInstance();

  runApp(MotivationalApp(preferences: preferences));
}

class MotivationalApp extends StatefulWidget {
  const MotivationalApp({
    super.key,
    this.locale,
    this.preferences,
  });

  final Locale? locale;
  final SharedPreferences? preferences;

  @override
  State<MotivationalApp> createState() => _MotivationalAppState();
}

class _MotivationalAppState extends State<MotivationalApp> {
  SharedPreferences? _preferences;
  Locale? _selectedLocale;

  @override
  void initState() {
    super.initState();
    _selectedLocale = widget.locale;
    _preferences = widget.preferences;

    if (_selectedLocale == null) {
      if (_preferences != null) {
        _selectedLocale = _localeFromCode(
          _preferences!.getString(_preferredLocaleKey),
        );
      } else {
        _loadSavedLocale();
      }
    }
  }

  Future<void> _loadSavedLocale() async {
    final preferences = await SharedPreferences.getInstance();
    final savedLocale = _localeFromCode(
      preferences.getString(_preferredLocaleKey),
    );

    if (!mounted) {
      return;
    }

    setState(() {
      _preferences = preferences;
      _selectedLocale = savedLocale;
    });
  }

  Future<void> _setLocale(Locale locale) async {
    setState(() {
      _selectedLocale = locale;
    });

    final preferences = _preferences ?? await SharedPreferences.getInstance();
    await preferences.setString(_preferredLocaleKey, locale.languageCode);

    if (!mounted) {
      return;
    }

    _preferences = preferences;
  }

  @override
  Widget build(BuildContext context) {
    const seedColor = Color.fromARGB(255, 136, 14, 79);

    return MaterialApp(
      locale: _selectedLocale,
      onGenerateTitle: (context) => AppLocalizations.of(context)!.appTitle,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: seedColor),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: seedColor,
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: const Color.fromARGB(255, 101, 5, 56),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.dark,
      home: Home(onLocaleSelected: _setLocale),
    );
  }
}

Locale? _localeFromCode(String? languageCode) {
  switch (languageCode) {
    case 'en':
      return const Locale('en');
    case 'it':
      return const Locale('it');
    default:
      return null;
  }
}
