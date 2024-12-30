import 'package:flutter/material.dart';

class AddItems extends StatelessWidget {
  AddItems({super.key, required this.onsubmitPlace});

  final void Function(String name) onsubmitPlace;
  final _titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new Place'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              maxLength: 50,
              decoration: const InputDecoration(
                label: Text('Title'),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                onsubmitPlace(_titleController.text);
                _titleController.clear();
              },
              child: const Row(
                mainAxisSize:
                    MainAxisSize.min, // Makes the button size fit its content
                children: [
                  Icon(Icons.add),
                  SizedBox(width: 8),
                  Text('Add Places'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
