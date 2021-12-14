class TodoModel {
  String content;
  bool done;

  TodoModel(
      this.content,
      this.done,
      );
}

class ListController {
  final Database database;
  List<TodoModel> todoList = [];

  ListController({required this.database});

  void addTodo(TodoModel todo) {
    todoList.add(todo);
  }

  void checkboxSelected(bool newValue, int index) {
    todoList[index].done = newValue;
  }

  void clear() {
    todoList.clear();
  }

  Future<void> loadFromDatabase() async {
    todoList.add(await database.loadDatabase());
  }
}

class Database {
  Future<TodoModel> loadDatabase() async {
    try {
      Future.delayed(Duration(seconds: 3));
      print("this got called?!?");
      return TodoModel("From Database", true);
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}