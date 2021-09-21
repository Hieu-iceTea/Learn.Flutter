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
      padding: const EdgeInsets.only(top: 50),
      child: Column(
        children: [
          Text(
            //"Result: Total Score = $totalScore",
            getResultPhrase,
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

  String get getResultPhrase {
    String resultText = "Result: Total Score = $totalScore.\n";

    if (totalScore <= 15) {
      resultText += 'You are so bad!';
    } else if (totalScore <= 30) {
      resultText += 'You are ... strange?!';
    } else if (totalScore <= 45) {
      resultText += 'Pretty likeable!';
    } else {
      resultText += 'You are awesome and innocent!';
    }

    return resultText;
  }
}
