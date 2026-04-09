import 'dart:async';

import 'package:flutter/material.dart';
import 'package:motivational_app/l10n/app_localizations.dart';

class RetryButton extends StatefulWidget {
  const RetryButton({super.key});

  @override
  State<StatefulWidget> createState() => _RetryButtonState();
}

class _RetryButtonState extends State<RetryButton> {
  double _opacity = 0.0;
  Timer? _fadeInTimer;

  @override
  void initState() {
    super.initState();
    _fadeInTimer = Timer(const Duration(milliseconds: 1000), () {
      if (!mounted) {
        return;
      }

      setState(() {
        _opacity = 1;
      });
    });
  }

  @override
  void dispose() {
    _fadeInTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return AnimatedOpacity(
      opacity: _opacity,
      duration: const Duration(milliseconds: 1200),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: OutlinedButton.icon(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 16),
            label: Text(l10n.retryButton),
          ),
        ),
      ),
    );
  }
}
