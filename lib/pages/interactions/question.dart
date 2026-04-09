import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  const Question({super.key, required this.text, this.style});

  final String text;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style?.copyWith(wordSpacing: 2.0) ??
          const TextStyle(wordSpacing: 2.0),
      textAlign: TextAlign.center,
    );
  }
}
