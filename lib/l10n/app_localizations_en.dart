// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Motivational App';

  @override
  String get homePrompt => 'Tell me your name';

  @override
  String get nameFieldLabel => 'Name';

  @override
  String get nameFieldHint => 'Type your name';

  @override
  String get enterButton => 'Enter';

  @override
  String get missingNameTitle => 'Idiot!';

  @override
  String get missingNameMessage => 'Enter your f*ucking name';

  @override
  String get dialogOk => 'Ok';

  @override
  String get retryButton => 'Retry';

  @override
  String get languageMenuLabel => 'Language';

  @override
  String get languageEnglish => 'English';

  @override
  String get languageItalian => 'Italian';

  @override
  String answerMessage(String userName) {
    return 'Fuck off $userName';
  }
}
