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
    return const MaterialApp(
      /*title: 'Welcome to Flutter',
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
      ),*/

      title: 'Startup Name Generator',
      home: RandomWords(),
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

    //final wordPair = WordPair.random();      // NEW
    //return Text(wordPair.asPascalCase);      // NEW

    final _suggestions = <WordPair>[];           // NEW
    const _biggerFont = TextStyle(fontSize: 18); // NEW

    Widget _buildRow(WordPair pair) {
      return ListTile(
        title: Text(
          pair.asPascalCase,
          style: _biggerFont,
        ),
      );
    }

    Widget _buildSuggestions() {
      return ListView.builder(
          padding: const EdgeInsets.all(16),
          // The itemBuilder callback is called once per suggested
          // word pairing, and places each suggestion into a ListTile
          // row. For even rows, the function adds a ListTile row for
          // the word pairing. For odd rows, the function adds a
          // Divider widget to visually separate the entries. Note that
          // the divider may be difficult to see on smaller devices.
          itemBuilder: (BuildContext _context, int i) {
            // Add a one-pixel-high divider widget before each row
            // in the ListView.
            if (i.isOdd) {
              return const Divider();
            }

            // The syntax "i ~/ 2" divides i by 2 and returns an
            // integer result.
            // For example: 1, 2, 3, 4, 5 becomes 0, 1, 1, 2, 2.
            // This calculates the actual number of word pairings
            // in the ListView,minus the divider widgets.
            final int index = i ~/ 2;
            // If you've reached the end of the available word
            // pairings...
            if (index >= _suggestions.length) {
              // ...then generate 10 more and add them to the
              // suggestions list.
              _suggestions.addAll(generateWordPairs().take(10));
            }
            return _buildRow(_suggestions[index]);
          }
      );
    }

    return Scaffold (                     // Add from here...
      appBar: AppBar(
        title: const Text('Startup Name Generator'),
      ),
      body: _buildSuggestions(),
    );

  }
}
