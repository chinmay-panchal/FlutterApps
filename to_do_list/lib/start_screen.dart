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
    setState(() {
      _items.removeAt(index); // Remove item at the given index
    });
  }

  void _tickItem(int index) {
    // Handle marking item as done or any other logic
    print('Item at index $index marked as done!');
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
                content: const Text(
                    'Title is Empty!'),
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
          content: const Text(
              'Title is empty!'),
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
              borderRadius: BorderRadius.circular(25), // Fully rounded corners
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
                  onRemoveItem: () => _removeItem(index), // Pass remove function
                  onTick: () => _tickItem(index), 
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
