import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DarkMode extends StatefulWidget {
  const DarkMode({super.key});

  @override
  State<DarkMode> createState() {
    return _DarkModeState();
  }
}

class _DarkModeState extends State<DarkMode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shri Radha Rani'),
      ),
      body: Column(
        children: [
          Card(
            child: ListTile(
              title: const Text('Getx Dialog Alert'),
              subtitle: const Text('subtitle 1'),
              onTap: () {
                Get.defaultDialog(
                  title: 'Delete Chat',
                  titlePadding: const EdgeInsets.only(top: 20),
                  contentPadding: const EdgeInsets.all(20),
                  // middleText: 'are you sure?',
                  content: const Column(
                    children: [Text('are you sure?')],
                  ),
                  confirm: TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text('Ok')),
                  cancel: TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text('Cancel')),
                );
              },
            ),
          ),
          Card(
            child: ListTile(
              title: const Text('Getx Bottom Sheet'),
              subtitle: const Text('subtitle 2'),
              onTap: () {
                Get.bottomSheet(
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          leading: const Icon(Icons.light_mode),
                          title: const Text('Light Theme;'),
                          onTap: () {
                            Get.changeTheme(ThemeData.light());
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.dark_mode),
                          title: const Text('Dark Theme'),
                          onTap: () {
                            Get.changeTheme(ThemeData.dark());
                          },
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
