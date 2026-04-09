// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get appTitle => 'App motivazionale';

  @override
  String get homePrompt => 'Dimmi il tuo nome';

  @override
  String get nameFieldLabel => 'Nome';

  @override
  String get nameFieldHint => 'Scrivi il tuo nome';

  @override
  String get enterButton => 'Invia';

  @override
  String get missingNameTitle => 'Idiota!';

  @override
  String get missingNameMessage => 'Inserisci il tuo cazzo di nome';

  @override
  String get dialogOk => 'Ok';

  @override
  String get closeButton => 'Chiudi';

  @override
  String get retryButton => 'Riprova';

  @override
  String get moreMenuTooltip => 'Altro';

  @override
  String get aboutMenuItem => 'Info';

  @override
  String get aboutDialogTitle => 'Info';

  @override
  String get aboutDialogGreeting => 'Ciao.';

  @override
  String get aboutDirectMessage =>
      'Spero che l\'app ti stia piacendo. Se ti ha strappato un sorriso e vuoi supportarla, puoi lasciare una piccola mancia.';

  @override
  String get aboutPlayMessage =>
      'Spero che l\'app ti stia piacendo. Se vuoi sapere qualcosa in piu sul progetto, dai un\'occhiata alla pagina del repository.';

  @override
  String get aboutDonationButton => 'Offrimi un caffe';

  @override
  String get aboutGithubButton => 'Apri il repo GitHub';

  @override
  String get externalLinkError => 'Non sono riuscito ad aprire il link.';

  @override
  String get languageMenuLabel => 'Lingua';

  @override
  String get languageEnglish => 'Inglese';

  @override
  String get languageItalian => 'Italiano';

  @override
  String answerMessage(String userName) {
    return 'Vaffanculo $userName';
  }
}
