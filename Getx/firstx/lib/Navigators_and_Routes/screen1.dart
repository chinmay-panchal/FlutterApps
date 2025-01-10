import 'package:firstx/Navigators_and_Routes/screen2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Screenone extends StatefulWidget {
  Screenone({super.key, this.name});

  var name;
  State<Screenone> createState() {
    return _ScreenoneState();
  }
}

class _ScreenoneState extends State<Screenone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen 1 ' + Get.arguments[0]),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: TextButton(
                  onPressed: () {
                    // Navigator.pop(context);
                    // Get.to(const Screentwo());
                    Get.toNamed('screen2');
                  },
                  child: const Text('Go to the screen 2'))),
        ],
      ),
    );
  }
}
