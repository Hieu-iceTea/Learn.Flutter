import 'package:flutter/material.dart';
import 'package:personal_expenses/model/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  List<Transaction> transactions = [
    Transaction(id: "id_1", title: "Title 1", amount: 1, date: DateTime.now()),
    Transaction(id: "id_2", title: "Title 2", amount: 2, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              child: Text('CHART!'),
              elevation: 5,
            ),
          ),
          Column(
            children: [
              for (var transaction in transactions)
                Card(
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 15,
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: Colors.black,
                          width: 2,
                        )),
                        padding: const EdgeInsets.all(10),
                        child: Text(transaction.amount.toString()),
                      ),
                      Column(
                        children: [
                          Text(transaction.title),
                          Text(transaction.date.toString()),
                        ],
                      ),
                    ],
                  ),
                ),
            ],
          )
        ],
      ),
    );
  }
}
