import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Text(
          'chat screen',
          style: TextStyle(
            color: Colors.grey[900],
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }
}
