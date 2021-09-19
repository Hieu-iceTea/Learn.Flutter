// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart'; // Add this line.

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final wordPair = WordPair.random(); // Add this line.
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to Flutter'),
        ),
        body: const Center(                       // Drop the const, and
          //child: Text('Hello World'),     // Replace this text...
          //child: Text(wordPair.asPascalCase),  // With this text.

          //child: Text(wordPair.asPascalCase), // REPLACE with...
          child: RandomWords(),                 // ...this line
        ),
      ),
    );
  }
}
class RandomWords extends StatefulWidget {
  const RandomWords({Key? key}) : super(key: key);

  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  @override
  Widget build(BuildContext context) {
    //return Container();
    final wordPair = WordPair.random();      // NEW
    return Text(wordPair.asPascalCase);      // NEW
  }
}
