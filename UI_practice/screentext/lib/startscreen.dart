import 'package:flutter/material.dart';

class Startscreen extends StatelessWidget {
  const Startscreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Start Screen'),
        ),
      ),
    );
  }
}