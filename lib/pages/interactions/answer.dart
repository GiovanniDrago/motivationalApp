import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String userName;
  const Answer({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            'Fuck off $userName',
            style: const TextStyle(wordSpacing: 2.0),
          ),
        ]),
      ),
    );
  }
}
