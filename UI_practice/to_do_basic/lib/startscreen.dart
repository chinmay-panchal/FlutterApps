import 'package:flutter/material.dart';

class Startscreen extends StatefulWidget {
  const Startscreen({super.key});

  @override
  State<Startscreen> createState() {
    return _StartscreenState();
  }
}

class _StartscreenState extends State<Startscreen> {
  final List<String> items = [];
  final _titalController = TextEditingController();

  void additem(String text) {
    if (text.isNotEmpty) {
      setState(() {
        items.add(text);
        _titalController.clear();
      });
    }
  }

  void ontick(int index) {
     ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Done: ${items[index]}"),
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.green,
      ),
    );
    setState(() {
      items.removeAt(index);
    });
  }

  void ondelete(int index) {
    setState(() {
      items.remove(items[index]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('To do List:')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _titalController,
                    decoration: const InputDecoration(hintText: 'Add your Task'),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    additem(_titalController.text);
                  },
                  child: const Text('Add'),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) => Card(
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          ontick(index);
                        },
                        icon: const Icon(
                          Icons.check_circle,
                        ),
                      ),
                      Expanded(child: Text(items[index])),
                      IconButton(
                        onPressed: () {
                          ondelete(index);
                        },
                        icon: const Icon(Icons.delete),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
