import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() {
    return _HomeScreenstate();
  }
}

class _HomeScreenstate extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Switch change'),
      ),
      body: Center(
        child: TextButton(
            onPressed: () {
              Get.toNamed('screen1');
            },
            child: Text('go to the first screen')),
      ),
    );
  }
}
