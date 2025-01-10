import 'package:favouritex/favorite.dart';
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
  final Favorite favorite = Get.put(Favorite());

  @override
  Widget build(BuildContext context) {
    print('rebuild');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite app'),
      ),
      body:
          ListView.builder(
              itemCount: favorite.items.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    onTap: () {
                      if (favorite.favitems.contains(favorite.items[index])) {
                        favorite.favitems.remove(favorite.items[index]);
                      } else {
                        favorite.favitems.add(favorite.items[index]);
                      }
                    },
                    title: Text(favorite.items[index]),
                    trailing: Obx(() => Icon(Icons.favorite, color: favorite.favitems.contains(favorite.items[index])? Colors.red : Colors.grey),)
                  ),
                );
              }),
    );
  }
}
