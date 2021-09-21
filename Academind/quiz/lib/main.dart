import 'package:flutter/material.dart';
import 'package:quiz/model/question.dart';
import 'package:quiz/widget/result.dart';

import 'model/answer.dart';
import 'widget/quiz.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  List<Question> questions = [
    Question(title: "What\'s your favorite color?", answers: [
      Answer(title: "Black", score: 5),
      Answer(title: "Red", score: 10),
      Answer(title: "Green", score: 15),
      Answer(title: "White", score: 20)
    ]),
    Question(title: "What\'s your favorite animal?", answers: [
      Answer(title: "Rabbit", score: 5),
      Answer(title: "Snake", score: 10),
      Answer(title: "Elephant", score: 15),
      Answer(title: "Lion", score: 20)
    ]),
    Question(title: "Who\'s your favorite programming language?", answers: [
      Answer(title: "Java", score: 5),
      Answer(title: "PHP", score: 10),
      Answer(title: "C#", score: 15),
      Answer(title: "Dart", score: 20)
    ]),
  ];

  int index = 0;
  int totalScore = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Quiz"),
        ),
        body: index < questions.length
            ? Quiz(
                questions: questions,
                index: index,
                onPressed: onPressed,
              )
            : Result(
                totalScore: totalScore,
                onButtonResetPressed: onButtonResetPressed,
              ),
      ),
    );
  }

  void onPressed(int currentScore) {
    setState(() {
      index++;
      /*if (index >= questions.length) {
        index = 0;
      }*/
    });

    totalScore += currentScore;

    print("index: $index");
    print("currentScore: $currentScore");
    print("totalScore: $totalScore");
  }

  void onButtonResetPressed() {
    setState(() {
      index = 0;
      totalScore = 0;
    });
  }
}
