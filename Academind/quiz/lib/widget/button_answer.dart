import 'package:flutter/material.dart';
import 'package:quiz/model/answer.dart';

class ButtonAnswer extends StatelessWidget {
  final Answer answer;
  final Function onPressed;

  const ButtonAnswer({required this.answer, required this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //width: double.infinity,
      child: ElevatedButton(
        onPressed: () => onPressed(answer.score),
        child: Text(answer.title),
        style: ElevatedButton.styleFrom(fixedSize: const Size.fromWidth(250)),
      ),
    );
  }
}
