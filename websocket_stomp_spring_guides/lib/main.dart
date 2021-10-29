import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import 'package:stomp_dart_client/stomp_frame.dart';

/// Chú ý: cần khởi đông dự án Spring của Hiếu khi chạy app Flutter này: https://github.com/Hieu-iceTea/FPT.Aptech.SEM4.Java/tree/main/Spring_Guide/websocket_stomp_spring_guides

// use this if you are using emulator. localhost is mapped to 10.0.2.2 by default.
const socketUrl = 'http://192.168.1.106:8080/websocket';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const title = 'WebSocket Demo (STOMP GS)';
    return const MaterialApp(
      title: title,
      home: MyHomePage(
        title: title,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controller = TextEditingController();
  StompClient? stompClient;
  List<String> messages = [];

  @override
  void initState() {
    if (stompClient == null) {
      stompClient = StompClient(
        config: StompConfig.SockJS(
          url: socketUrl,
          onConnect: _onConnectCallback,
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

  void _onConnectCallback(StompFrame connectFrame) {
    // client is connected and ready

    stompClient!.subscribe(
      destination: '/topic/greetings',
      callback: (StompFrame frame) {
        if (frame.body != null) {
          Map<String, dynamic> result = json.decode(frame.body!);
          setState(() => messages.add(result['content']));
        }
      },
    );
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      String body = json.encode({
        'name': _controller.text,
      });
      stompClient!.send(destination: "/app/hello", body: body);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Form(
                child: TextFormField(
                  controller: _controller,
                  decoration:
                      const InputDecoration(labelText: 'Send a message (What is your name?)'),
                ),
              ),
              const SizedBox(height: 24),
              ...List.generate(
                  messages.length, (index) => Text(messages[index]))
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _sendMessage,
        tooltip: 'Send message',
        child: const Icon(Icons.send),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
