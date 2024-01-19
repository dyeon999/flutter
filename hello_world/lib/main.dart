import 'package:flutter/material.dart';

void main() {
  runApp(App()); // App() Widget 이 기본 베이스 위젯!
}

class App extends StatelessWidget { // Root Widget
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold( // home도 위젯임
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text("Hello Flutter", style: TextStyle(color: Colors.white),), // 에바 title도 위젯
        ),
        body: Center(
          child: Text("Hello World!"),
        ), // 젠장 body도 위젯임
      ),
    );
  }
  
}