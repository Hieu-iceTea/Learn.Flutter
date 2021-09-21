import 'package:flutter/material.dart';
import 'package:quiz/model/answer.dart';

class ButtonAnswer extends StatelessWidget {
  final Answer answer;
  final VoidCallback? onPressed;

  const ButtonAnswer({required this.answer, required this.onPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(onPressed: onPressed, child: Text(answer.title)),
    );
  }
}
