import 'package:flutter/material.dart';
import 'package:languagex/home_screen.dart';
import 'package:get/get.dart';
import 'package:languagex/languages.dart';

// #GetMaterialApp
// step 1 : by default local and fallback locale ko aap add karskte h
// step 2 : extend translations in languages.dart, the class should have the mapping
// step 3 : import the languages and assign to translations: Languages(),
// step 4 : Home screen m keys ka use karke text('key_name'.tr) in listtile // tr means translation
// step 5 : yeh 3 chize h fir home_screen m toh Get.updatelocal(Locale('key','pair'))

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
      locale: Locale('en', 'Us'),
      translations: Languages(),
      // locale: Locale('hi', 'IN'),
      fallbackLocale : Locale('en', 'US'),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}