import 'package:flutter/material.dart';
import 'package:motivational_app/l10n/app_localizations.dart';
import 'package:motivational_app/pages/interactions/answer_form.dart';
import 'package:motivational_app/pages/interactions/question.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;

    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight - 48,
              ),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 360),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Question(
                        text: l10n.homePrompt,
                        style: theme.textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 16),
                      const AnswerForm(),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
