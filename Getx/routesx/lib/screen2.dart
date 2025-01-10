import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TwoScreen extends StatefulWidget {
  const TwoScreen({super.key});

  @override
  State<TwoScreen> createState() {
    return _TwoScreenstate();
  }
}

class _TwoScreenstate extends State<TwoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('screen two'),
      ),
      body: Center(
        child: TextButton(
            onPressed: () {
              Navigator.pop(context);
              // Get.back();
              Get.back();
            },
            child: Text('go to the first screen')),
      ),
    );
  }
}
