import 'package:counterx/counter_increment.dart';
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
  final CounterController controller = Get.put(CounterController());
  @override
  Widget build(BuildContext context) {
    print('rebuild');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter incrementer'),
      ),
      body: Center(
        child:
            // Obx(() => Text(
            //       controller.counter.toString(),
            //       style: TextStyle(fontSize: 60),
            //     )),
            Obx(() {
          return Text(
            controller.counter.toString(),
            style: TextStyle(fontSize: 60),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        controller.incrementCounter();
      }),
    );
  }
}
