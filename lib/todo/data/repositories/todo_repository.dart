import 'package:todo_architec/shared/data/models/page_model.dart';
import 'package:todo_architec/todo/data/models/todo.dart';
import 'package:todo_architec/todo/data/services/todo_service.dart';

class TodoRepository {
  final TodoService todoService;
  TodoRepository({
    required this.todoService,
  });

  Future<PageModel<Todo>> fetchTodos() async {
    var jsonData = await todoService.fetchTodos();
    return PageModel<Todo>.fromJson(
      jsonData,
      (childData) {
        return Todo.fromJson(childData);
      },
    );
  }
}
