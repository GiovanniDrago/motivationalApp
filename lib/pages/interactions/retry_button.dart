import 'package:flutter/material.dart';

class RetryButton extends StatefulWidget {
  const RetryButton({super.key});

  @override
  State<StatefulWidget> createState() => _RetryButtonState();
}

class _RetryButtonState extends State<RetryButton> {
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1000), () {
      setState(() {
        _opacity = 1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: true,
      child: AnimatedOpacity(
        opacity: _opacity,
        duration: const Duration(milliseconds: 1200),
        child: Padding(
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
        ),
      ),
    );
  }
}
