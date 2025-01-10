import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:routesx/home_screen.dart';
import 'package:routesx/screen1.dart';
import 'package:routesx/screen2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
      getPages: [
        GetPage(name: '/', page: () => HomeScreen()),
        GetPage(name: '/screen1', page: ()=> OneScreen()),
        GetPage(name: '/screen2', page: ()=> TwoScreen()),
      ],
    );
  }
}
