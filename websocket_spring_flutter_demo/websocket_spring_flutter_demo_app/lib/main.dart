import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import 'package:stomp_dart_client/stomp_frame.dart';

/// Nguồn tham khảo: https://umes4ever.medium.com/real-time-application-using-websocket-spring-boot-java-react-js-flutter-eb87fe95f94f

// use this if you are using emulator. localhost is mapped to 10.0.2.2 by default.
const socketUrl = 'http://192.168.1.106:8080/webSocket-message'; //192.168.1.106

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const title = 'WebSocket Demo';
    return const MaterialApp(
      title: title,
      home: MyHomePage(title: title),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  StompClient? stompClient;

  String message = '';

  void onConnectCallback(StompFrame connectFrame) {
    // client is connected and ready

    stompClient!.subscribe(
      destination: '/topic/message',
      callback: (StompFrame frame) {
        if (frame.body != null) {
          Map<String, dynamic> result = json.decode(frame.body!);
          setState(() => message = result['message']);
        }
      },
    );
  }

  @override
  void initState() {
    if (stompClient == null) {
      stompClient = StompClient(
        config: StompConfig.SockJS(
          url: socketUrl,
          onConnect: onConnectCallback,
          onWebSocketError: (dynamic error) => print(error.toString()),
        ),
      );

      stompClient!.activate();
    }

    super.initState();
  }

  @override
  void dispose() {
    if (stompClient != null) {
      stompClient!.deactivate();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Your message from server:',
            ),
            Text(
              message,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
