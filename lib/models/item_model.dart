class ItemModel {
  String title;
  bool isDone;

  ItemModel({required this.title, this.isDone = false});

  void toggleStatus() {
    isDone = !isDone;
  }

  ItemModel.fromMap(Map<String, dynamic> map) : title = map['title'], isDone = map['isDone'];

  Map<String, dynamic> toMap() => {'title' : title, 'isDone': isDone};
}