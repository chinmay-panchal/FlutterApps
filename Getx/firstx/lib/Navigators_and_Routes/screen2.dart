import 'package:firstx/Navigators_and_Routes/screen1.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Screentwo extends StatefulWidget {
  const Screentwo({super.key});
  State<Screentwo> createState() {
    return _ScreentwoState();
  }
}

class _ScreentwoState extends State<Screentwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen 2'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: TextButton(
                  onPressed: () {
                    // Navigator.pop(context);
                    Get.back();
                    Get.back(); // double get back will got to the back screen of back screen
                    // Get.toNamed('/screen1', arguments: ['Hare Krishna']);
                  },
                  child: Text('Go back to home'))),
        ],
      ),
    );
  }
}
