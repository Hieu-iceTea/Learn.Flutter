import 'package:flutter/material.dart';

class LabelQuestion extends StatelessWidget {
  final String questionTitle;

  const LabelQuestion({required this.questionTitle, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Text(
        questionTitle,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 28),
      ),
    );
  }
}
