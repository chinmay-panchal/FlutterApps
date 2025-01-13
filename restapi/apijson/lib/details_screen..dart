import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final int id;
  final String token;

  const DetailsScreen({Key? key, required this.id, required this.token})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('ID: $id', style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            Text('Token: $token', style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}