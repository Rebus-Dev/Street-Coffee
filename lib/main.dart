import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Street Coffee',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Street Coffee'),
        ),
        body: Center(
          child: Text('Hello Street Coffee'),
        ),
      ),
    );
  }
}