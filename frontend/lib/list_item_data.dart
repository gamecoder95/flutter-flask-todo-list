class ListItemData {

  static int listItemIndex = 0; 

  int index;
  String text;
  bool isDone;

  new(this.index, [this.text = "", this.isDone = false]);
}