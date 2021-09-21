import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalScore;
  final Function onButtonResetPressed;

  const Result(
      {required this.totalScore, required this.onButtonResetPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Text(
            "Result: Total Score = $totalScore",
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 28),
          ),
          TextButton(
            onPressed: () => onButtonResetPressed(),
            child: const Text("Reset"),
          )
        ],
      ),
    );
  }
}
