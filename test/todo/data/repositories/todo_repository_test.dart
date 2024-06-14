import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_architec/shared/data/models/page_model.dart';
import 'package:todo_architec/todo/data/models/todo.dart';
import 'package:todo_architec/todo/data/repositories/todo_repository.dart';
import 'package:todo_architec/todo/data/services/todo_service.dart';

import '../../../fixtures/fixtures.dart';

class _MockTodoService extends Mock implements TodoService {}

final result = PageModel(
  total: 10,
  skip: 0,
  limit: 10,
  items: List.filled(10, Fixtures().todo()),
);

void main() {
  late TodoService todoService;
  late TodoRepository todoRepository;

  setUp(() {
    todoService = _MockTodoService();
    todoRepository = TodoRepository(todoService: todoService);
  });

  test('Returns PageModel when service returns Json', () async {
    // GIVEN
    when(() => todoService.fetchTodos()).thenAnswer((invocation) async =>
        result.toJson((child) => (child as Todo).toJson()));

    // WHEN
    final receivedResult = await todoRepository.fetchTodos();

    // THEN
    expect(receivedResult.items, result.items);
  });
}
