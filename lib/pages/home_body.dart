import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motivational_app/pages/interactions/question.dart';

class HomeBody extends StatefulWidget {
  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  String userName = '';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Question(),
          OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/answer');
              },
              child: const Text('Enter'))
        ],
      ),
    );
  }
}
