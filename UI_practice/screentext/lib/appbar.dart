import 'package:flutter/material.dart';
import 'package:screentext/additems.dart';

class Appbar extends StatefulWidget {
  const Appbar({super.key});

  @override
  State<Appbar> createState() {
    return _AppbarState();
  }
}

class _AppbarState extends State<Appbar> {
  final List<String> _registeredPlaces=[];

  void _additem() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => AddItems(
          onsubmitPlace: addplace,
        ), // Create the AddItems screen here
      ),
    );
  }

  void addplace(String place) {
    setState(() {
      _registeredPlaces.add(place);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Places'),
        actions: [
          IconButton(
            onPressed: _additem,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: _registeredPlaces.isEmpty
          ? const Center(
              child: Text('No places added yet! Start adding some.'),
            )
          : ListView.builder( 
              itemCount: _registeredPlaces.length,
              itemBuilder: (ctx, index) => ListTile(
                leading: const Icon(Icons.place),
                title: Text(_registeredPlaces[index]),
              ),
            ),
    );
  }
}
