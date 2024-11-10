import 'package:flutter/material.dart';

import 'retry_button.dart';

class Answer extends StatelessWidget {
  const Answer({super.key});

  @override
  Widget build(BuildContext context) {
    final userName = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            'Fuck off $userName',
            style: const TextStyle(wordSpacing: 2.0),
          ),
          RetryButton()
        ]),
      ),
    );
  }
}
