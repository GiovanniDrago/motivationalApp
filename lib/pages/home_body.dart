import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motivational_app/pages/interactions/answer_form.dart';
import 'package:motivational_app/pages/interactions/question.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  String userName = '';
  final TextEditingController _name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Question(),
          AnswerForm(name: _name),
        ],
      ),
    );
  }
}
