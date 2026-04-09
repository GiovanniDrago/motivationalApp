import 'package:flutter/material.dart';
import 'package:motivational_app/l10n/app_localizations.dart';

class DialogNoName extends StatelessWidget {
  const DialogNoName({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return AlertDialog(
      title: Text(l10n.missingNameTitle),
      content: Text(l10n.missingNameMessage),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'OK'),
          child: Text(l10n.dialogOk),
        ),
      ],
    );
  }
}
