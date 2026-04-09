import 'package:flutter/material.dart';
import 'package:motivational_app/l10n/app_localizations.dart';
import 'package:motivational_app/pages/interactions/retry_button.dart';

class Answer extends StatelessWidget {
  const Answer({super.key, required this.userName});

  final String userName;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 360),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    l10n.answerMessage(userName),
                    style: theme.textTheme.headlineSmall?.copyWith(
                      wordSpacing: 2.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  const RetryButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
