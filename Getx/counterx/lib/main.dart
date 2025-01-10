import 'package:counterx/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// flutter pub add get, material app
// step 1 : make a class and extend for GetxController, rx datatype and intialization with obs.
// step 2 : home screen m object banado us clas ka
// step 3 : fir us object k varibale ko print kardo, button m function call karne k baad #obx m text ko rakhna h

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}