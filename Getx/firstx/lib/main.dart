import 'package:firstx/Navigators_and_Routes/home.dart';
import 'package:firstx/Navigators_and_Routes/screen1.dart';
import 'package:firstx/Navigators_and_Routes/screen2.dart';
import 'package:firstx/dark_mode.dart';
import 'package:firstx/responsive.dart';
// import 'package:firstx/dark_mode.dart';
// import 'package:firstx/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      themeMode: ThemeMode.light,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Responsive(),
      // routes in getx
      // getPages: [
      //   GetPage(name: '/', page:() => const Home()),
      //   GetPage(name: '/screen1', page:() => Screenone()),
      //   GetPage(name: '/screen2', page:() => const Screentwo()),
      // ],
    );
  }
}