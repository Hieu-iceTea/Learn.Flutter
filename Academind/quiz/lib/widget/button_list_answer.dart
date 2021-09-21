import 'package:flutter/material.dart';
import 'package:quiz/model/answer.dart';

import 'button_answer.dart';

class ButtonListAnswer extends StatelessWidget {
  List<Answer> answers;
  final VoidCallback? onPressed;

  ButtonListAnswer({required this.answers, required this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          for (var answer in answers)
            ButtonAnswer(onPressed: onPressed, answer: answer),
          //...answers.map((answer) => ButtonAnswer(answer: answer)).toList()
        ],
      ),
    );
  }
}
