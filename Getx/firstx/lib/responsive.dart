import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Responsive extends StatefulWidget {
  const Responsive({super.key});

  @override
  State<Responsive> createState() {
    return _ResponsiveState();
  }
}

class _ResponsiveState extends State<Responsive> {
  @override
  Widget build(BuildContext context) {
    // final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Shri Radha Rani'),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.red,
            height: Get.height * .2,
            width: Get.width * .8,
            child: const Center(
              child: Text('Center'),
            ),
          ),
          Container(
            color: Colors.green,
            height: Get.height * .1,
            width: Get.width * .8,
            child: const Center(
              child: Text('second'),
            ),
          ),
          
        ],
      ),
    );
  }
}
