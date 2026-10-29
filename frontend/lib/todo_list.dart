import 'package:flutter/material.dart';
import 'list_item_data.dart';
import 'todo_list_item.dart';

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