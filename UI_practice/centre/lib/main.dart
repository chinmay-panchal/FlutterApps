import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            width: 200,
            height: 100,
            decoration: BoxDecoration(
            color: Colors.yellow,          // Background color of the container
            border: Border.all(          // Add border
              color: Colors.black,       // Border color
              width: 2,                   // Border width
            ),
            borderRadius: BorderRadius.circular(8), // Rounded corners (optional)
          ),
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text('I am in the centre, how about you?', style: TextStyle(
                      fontFamily: 'Roboto',
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.black,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                    ),
                  ),
                ),
          // Text(
          //   'This is a long text that will overflowwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww',
          //   overflow: TextOverflow.ellipsis,
          // ),
          // Text(
          //   'Centered Text',
          //   textAlign: TextAlign.center,
          // ),
          ),
        ),
      ),
    );
  }
}

