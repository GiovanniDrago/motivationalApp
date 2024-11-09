import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: OverflowBar(
              spacing: 10,
              overflowSpacing: 20,
              alignment: MainAxisAlignment.center,
              overflowAlignment: OverflowBarAlignment.center,
              children: <Widget>[
                OutlinedButton.icon(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/');
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: 16,
                  ),
                  label: const Text('Retry'),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
