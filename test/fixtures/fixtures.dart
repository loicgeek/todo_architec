import 'package:todo_architec/todo/data/models/todo.dart';

final class Fixtures {
  Todo todo() {
    return Todo(id: 1, todo: 'todo', completed: false, userId: 3);
  }
}
