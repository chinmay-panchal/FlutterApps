import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imagex/image_picker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  final ImagePickerController imagePickerController =
      Get.put(ImagePickerController());

  @override
  Widget build(BuildContext context) {
    print('rebuild');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image picker'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(() =>
            CircleAvatar(
              radius: 40,
              backgroundImage: imagePickerController.path.isNotEmpty? 
              FileImage(File(imagePickerController.path.toString())) :
              null
            ),),
            TextButton(
                onPressed: () {
                  imagePickerController.getImage();
                },
                child: Text('pick image')),
          ],
        ),
      ),
    );
  }
}
