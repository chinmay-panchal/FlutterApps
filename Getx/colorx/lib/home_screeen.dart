import 'package:colorx/color_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  final ColorController colorController = Get.put(ColorController());

  @override
  Widget build(BuildContext context) {
    print('rebuild');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Color Opacity Changer'),
      ),
      body: Column(
        children: [
          Obx(() =>  Container(
                height: 240,
                width: 240,
                color: Colors.red.withOpacity(colorController.opacity.value),
              )),
          Obx(() => Slider(
              value: colorController.opacity.value,
              onChanged: (current) {
                colorController.changeOpacity(current);
              })),
        ],
      ),
    );
  }
}
