import 'package:flutter/material.dart';

class DialogNoName extends StatelessWidget {
  const DialogNoName({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Idiot!'),
      content: const Text('Enter your f*ucking name'),
      actions: <Widget>[
        TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('Ok'))
      ],
    );
  }
}
