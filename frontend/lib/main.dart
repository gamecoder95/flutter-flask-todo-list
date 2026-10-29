import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: TodoList()));
}

class ListItemData {

  static int listItemIndex = 0; 

  int index;
  String text;
  bool isDone;

  new(this.index, [this.text = "", this.isDone = false]);
}

class TodoList extends StatefulWidget {
  const new({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {

  List<ListItemData> dummyData = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('TODO List'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            int newIndex = ListItemData.listItemIndex++;
            dummyData.add(ListItemData(newIndex, "Item $newIndex"));
          });
        },
        child: const Icon(Icons.add)
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: dummyData.length,
        itemBuilder: (_, index) {
          return TodoListItem(index: dummyData[index].index, text: dummyData[index].text, isDone: dummyData[index].isDone, onChecked: onChecked, onDelete: onDelete);
        }
      )
    );
  }

  void onChecked(int index) {
    setState(() {
      var listItem = dummyData.firstWhere((item) => item.index == index);
      listItem.isDone = !listItem.isDone;
    });
  }

  void onDelete(int index) {
    setState(() {
      dummyData.removeWhere((data) => data.index == index);
    });
  }
}

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

