class TodoModel {
  int? userId;
  int? id;
  String? title;
  bool? completed;

  TodoModel({this.completed, this.id, this.title, this.userId});

  TodoModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    completed = json['completed'];
  }
}
