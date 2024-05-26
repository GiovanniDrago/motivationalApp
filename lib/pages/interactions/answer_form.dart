import 'package:flutter/material.dart';
import 'package:motivational_app/pages/interactions/dialog_no_name.dart';

class AnswerForm extends StatelessWidget {
  const AnswerForm({
    super.key,
    required TextEditingController name,
  }) : _name = name;

  final TextEditingController _name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 250,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: TextField(
              controller: _name,
              onSubmitted: (String value) async {
                checkName(value, context);
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: OutlinedButton(
              onPressed: () {
                checkName(_name.text, context);
              },
              child: const Text('Enter')),
        )
      ],
    );
  }

  void checkName(String value, BuildContext context) {
    if (value != '') {
      Navigator.pushReplacementNamed(context, '/answer', arguments: value);
    } else {
      showDialog<String>(
          context: context, builder: (BuildContext context) => DialogNoName());
    }
  }
}
