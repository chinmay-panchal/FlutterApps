import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notificationx/switch.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() {
    return _HomeScreenstate();
  }
}

class _HomeScreenstate extends State<HomeScreen> {
  Switchx switchx = Get.put(Switchx());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Switch change'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Notifications'),
              Obx(()=> Switch(
                  value: switchx.val.value,
                  onChanged: (current) {
                    switchx.changeSwitch(current);
                  }),
              ),
            ],
          )
        ],
      ),
    );
  }
}
