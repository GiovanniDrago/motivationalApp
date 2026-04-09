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
  String get closeButton => 'Close';

  @override
  String get retryButton => 'Retry';

  @override
  String get moreMenuTooltip => 'More';

  @override
  String get aboutMenuItem => 'About';

  @override
  String get aboutDialogTitle => 'About';

  @override
  String get aboutDialogGreeting => 'Hi.';

  @override
  String get aboutDirectMessage =>
      'I hope you\'re enjoying the app. If it made you smile and you want to support it, you can leave a small tip.';

  @override
  String get aboutPlayMessage =>
      'I hope you\'re enjoying the app. If you want to know more about the project, check the repository page.';

  @override
  String get aboutDonationButton => 'Buy me a coffee';

  @override
  String get aboutGithubButton => 'Open GitHub repo';

  @override
  String get externalLinkError => 'Couldn\'t open the link.';

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
