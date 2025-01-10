import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:routesx/screen2.dart';

class OneScreen extends StatefulWidget {
  const OneScreen({super.key});

  @override
  State<OneScreen> createState() {
    return _OneScreenstate();
  }
}

class _OneScreenstate extends State<OneScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('screen 1'),
      ),
      body: Center(
        child: TextButton(
            onPressed: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (ctx) => const TwoScreen()));
              Get.toNamed('/screen2');
            },
            child: Text('go to the first screen')),
      ),
    );
  }
}
