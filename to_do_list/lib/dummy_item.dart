import 'package:flutter/material.dart';
import 'package:to_do_list/dummy_data.dart';

class DummyItem extends StatelessWidget {
  const DummyItem(
    this.item, {
    required this.onTick,
    required this.onRemoveItem,
    super.key,
  });

  final void Function() onTick;
  final void Function() onRemoveItem;

  final DummyData item;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        child: Row(
          children: [
            IconButton(
              onPressed: onTick,
              icon: Icon(
                item.isChecked
                    ? Icons.check_circle
                    : Icons.radio_button_unchecked,
                color: Colors.green,
              ),
            ),
            Expanded(
              child: Text(
                item.text,
                style: TextStyle(
                    decoration:
                        item.isChecked ? TextDecoration.lineThrough : null),
              ),
            ),
            IconButton(
                onPressed: onRemoveItem,
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                )),
          ],
        ),
      ),
    );
  }
}
