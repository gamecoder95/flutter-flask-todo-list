import 'package:flutter/material.dart';

class TodoListItem extends StatelessWidget {
  const new({
    super.key,
    required this.index,
    required this.text,
    required this.isDone,
    required this.onChecked,
    required this.onDelete
  });

  final int index;
  final String text;
  final bool isDone;
  final Function(int index) onChecked;
  final Function(int index) onDelete;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(value: isDone, onChanged: (_) => onChecked(index)),
        Text(text),
        IconButton(onPressed: () => onDelete(index), icon: const Icon(Icons.delete))
      ]
    );
  }
}