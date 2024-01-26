class TodosListModel {
  int total;
  int skip;
  int limit;
  List<TodoModel> todos;
  TodosListModel({
    required this.total,
    required this.skip,
    required this.limit,
    required this.todos,
  });

  factory TodosListModel.fromJson(Map<String, dynamic> json) {

    List<TodoModel> eachTodo=[];
    for(Map<String, dynamic> eachMap in json['todos']){
      var data=TodoModel.fromJson(eachMap);
      eachTodo.add(data);
    }
    return TodosListModel(
      total: json['total'],
      skip: json['skip'],
      limit: json['limit'],
      todos: eachTodo,
    );
  }
}

class TodoModel {
  int id;
  String todo;
  bool completed;
  int userId;
  TodoModel({
    required this.id,
    required this.todo,
    required this.completed,
    required this.userId,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json['id'],
      todo: json['todo'],
      completed: json['completed'],
      userId: json['userId'],
    );
  }
}
