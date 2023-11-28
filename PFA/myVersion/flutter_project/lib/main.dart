import 'package:flutter/material.dart';
import 'package:flutter_project/Manager/homes/home_screen_manager.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Safe Dispose',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Manager(),
    );
  }
}
