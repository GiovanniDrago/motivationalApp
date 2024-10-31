import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  const Question({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Tell me your name',
      style: TextStyle(wordSpacing: 2.0),
    );
  }
}
