import 'package:flutter/material.dart';
import 'package:roll_dice/gradient_container.dart';

void main() {
  runApp( 
  const MaterialApp(
    home: Scaffold(
        body: GradientContainer(
            Color.fromARGB(255, 60, 129, 248),
            Color.fromARGB(255, 17, 99, 241),
          ),
      ),
    )
  );
}
