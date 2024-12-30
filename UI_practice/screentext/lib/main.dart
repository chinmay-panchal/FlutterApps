import 'package:flutter/material.dart';
import 'package:screentext/appbar.dart';
// import 'package:screentext/startscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Appbar(),
    );
  }
}
