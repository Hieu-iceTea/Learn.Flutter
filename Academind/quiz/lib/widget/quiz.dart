import 'package:flutter/material.dart';
import 'package:quiz/model/question.dart';

import 'button_list_answer.dart';
import 'label_question.dart';

class Quiz extends StatelessWidget {
  List<Question> questions;
  int index;
  final Function onPressed;

  Quiz(
      {required this.questions,
      required this.index,
      required this.onPressed,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          LabelQuestion(questionTitle: questions.elementAt(index).title),
          ButtonListAnswer(
            onPressed: onPressed,
            answers: questions.elementAt(index).answers,
          ),
        ],
      ),
    );
  }
}
