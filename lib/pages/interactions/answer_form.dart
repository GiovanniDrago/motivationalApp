import 'package:flutter/material.dart';
import 'package:motivational_app/l10n/app_localizations.dart';
import 'package:motivational_app/pages/interactions/answer.dart';
import 'package:motivational_app/pages/interactions/dialog_no_name.dart';

class AnswerForm extends StatefulWidget {
  const AnswerForm({super.key});

  @override
  State<AnswerForm> createState() => _AnswerFormState();
}

class _AnswerFormState extends State<AnswerForm> {
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: _nameController,
          autofocus: true,
          textInputAction: TextInputAction.done,
          onSubmitted: (_) => _submit(),
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: l10n.nameFieldLabel,
            hintText: l10n.nameFieldHint,
          ),
        ),
        const SizedBox(height: 12),
        OutlinedButton(onPressed: _submit, child: Text(l10n.enterButton)),
      ],
    );
  }

  Future<void> _submit() async {
    final value = _nameController.text.trim();

    if (value.isEmpty) {
      await showDialog<String>(
        context: context,
        builder: (dialogContext) => const DialogNoName(),
      );
      return;
    }

    await Navigator.of(context).push<void>(
      MaterialPageRoute(builder: (context) => Answer(userName: value)),
    );

    if (!mounted) {
      return;
    }

    _nameController.clear();
  }
}
