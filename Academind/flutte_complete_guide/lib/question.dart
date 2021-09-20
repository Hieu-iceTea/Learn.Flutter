import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String question;

  //Question({Key? key, required this.question}) : super(key: key);
  const Question(this.question, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Text(
        question,
        style: TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ),
    );
  }
}
