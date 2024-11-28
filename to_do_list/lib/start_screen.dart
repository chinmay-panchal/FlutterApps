import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/dummy_data.dart';
import 'package:to_do_list/dummy_item.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() {
    return _StartScreenState();
  }
}

class _StartScreenState extends State<StartScreen> {
  final List<DummyData> _items = [
    DummyData(text: 'Finish to do app'),
    DummyData(text: 'Finish flutter course'),
  ];

  final _titalController = TextEditingController();


  double get commitmentPercentage {
    int checkedItems = _items.where((item) => item.isChecked).length;
    int totalItems = _items.length;
    return totalItems > 0 ? (checkedItems / totalItems) * 100 : 0;
  }


  void _additem() {
    if (_titalController.text.trim().isEmpty) {
      _showDialog();
      return;
    }

    setState(() {
      _items.add(
        DummyData(text: _titalController.text),
      );
    });
  }

  void _removeItem(int index) {
    final removedItem = _items[index];
    setState(() {
      _items.removeAt(index); // Remove item at the given index
    });

    ScaffoldMessenger.of(context)
        .clearSnackBars(); // pehle wale undo's ko hathane k liye (lagataar boht delete kradiye ho aur current ko undo karna hotoh)
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('item deleted'),
        action: SnackBarAction(
          label: 'undo',
          onPressed: () {
            setState(() {
              _items.insert(
                index, removedItem,
              );
            });
          },
        ),
      ),
    );
  }

  void _tickItem(int index) {
    setState(() {
      _items[index].isChecked = !_items[index].isChecked;
    });
  }

  @override
  void dispose() {
    _titalController.dispose();
    super.dispose();
  }

  void _showDialog() {
    if (Platform.isIOS) {
      showCupertinoDialog(
          context: context,
          builder: (ctx) => CupertinoAlertDialog(
                title: const Text('Invalid input'),
                content: const Text('Title is Empty!'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(ctx);
                    },
                    child: const Text('Okay'),
                  ),
                ],
              ));
    } else {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid input'),
          content: const Text('Title is empty!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('Okay'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'To Do List',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(25),
            ),
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // const Text(
                //   'Add your task',
                //   style: TextStyle(fontSize: 16),
                // ),
                Expanded(
                  child: TextField(
                    controller: _titalController,
                    decoration: const InputDecoration(
                      hintText: 'Add your Task',
                      hintStyle: TextStyle(fontSize: 16),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextButton(
                    onPressed: _additem,
                    child: const Text(
                      'Add',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
            child: ListView.builder(
              itemCount: _items.length,
              itemBuilder: (context, index) {
                return DummyItem(
                  _items[index],
                  onRemoveItem: () =>
                      _removeItem(index), 
                  onTick: () => _tickItem(index),
                );
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircularProgressIndicator(
                  value: commitmentPercentage / 100,
                  strokeWidth: 2,
                  valueColor:const AlwaysStoppedAnimation<Color>(Colors.blue),
                ),
                Text(
                  '${commitmentPercentage.toStringAsFixed(0)}%',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 2, 47, 129),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
