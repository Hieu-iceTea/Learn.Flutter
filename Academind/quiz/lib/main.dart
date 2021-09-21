import 'package:flutter/material.dart';
import 'package:quiz/model/question.dart';

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
    Question(title: "Question Title 1", answers: [
      Answer(title: "Answer Title A", score: 5),
      Answer(title: "Answer Title B", score: 10),
      Answer(title: "Answer Title C", score: 15),
      Answer(title: "Answer Title D", score: 20)
    ]),
    Question(title: "Question Title 2", answers: [
      Answer(title: "Answer Title A", score: 5),
      Answer(title: "Answer Title B", score: 10),
      Answer(title: "Answer Title C", score: 15),
      Answer(title: "Answer Title D", score: 20)
    ]),
    Question(title: "Question Title 3", answers: [
      Answer(title: "Answer Title A", score: 5),
      Answer(title: "Answer Title B", score: 10),
      Answer(title: "Answer Title C", score: 15),
      Answer(title: "Answer Title D", score: 20)
    ]),
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Title"),
        ),
        body: Quiz(questions: questions, index: index, onPressed: onPressed),
      ),
    );
  }

  void onPressed() {
    setState(() {
      index = index + 1;
      if (index >= questions.length) {
        index = 0;
      }
    });

    print("index: $index");
  }
}
