import 'package:flutter/material.dart';
// import 'package:firstx/Navigators_and_Routes/screen1.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigators and routes'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: TextButton(
                  onPressed: () {
                    // Navigator.push(context,MaterialPageRoute(builder: (ctx) => const Screenone()));
                    // Get.to(Screenone(name: 'Shri Radhika Rani'));
                    Get.toNamed('/screen1', arguments: [
                      'shri Radhika Rani',
                      'Radha wallabh Shri Hariwansh'
                    ]);
                  },
                  child: const Text('Go to the next screen'))),
        ],
      ),
    );
  }
}
