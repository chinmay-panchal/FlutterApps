import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  State<HomeScreen> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hare Krishna'),
      ),
      body: const Column(
        children: [],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Get.snackbar('shri radha', 'vallabh shri harivansh', mainButton: TextButton(onPressed: (){}, child: const Text('Click')), snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.green);
      }),
    );
  }
}
