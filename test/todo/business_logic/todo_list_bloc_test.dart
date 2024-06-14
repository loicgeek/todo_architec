import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_architec/shared/data/models/page_model.dart';
import 'package:todo_architec/todo/business_logic/todos_list/todos_list_bloc.dart';
import 'package:todo_architec/todo/data/repositories/todo_repository.dart';

import '../../fixtures/fixtures.dart';

class _MockTodoRepository extends Mock implements TodoRepository {}

void main() {
  late TodoRepository todoRepository;

  setUp(() {
    todoRepository = _MockTodoRepository();
  });

  blocTest<TodosListBloc, TodosListState>(
    'emits [FetchTodosListFailure] when service throws an exception',
    /* GIVEN */
    setUp: () {
      when(() => todoRepository.fetchTodos()).thenThrow(Exception());
    },
    build: () => TodosListBloc(repository: todoRepository),
    /** WHEN */
    act: (bloc) => bloc.add(FetchTodosList()),
    /** THEN */
    expect: () => [
      isA<FetchTodosListLoading>(),
      isA<FetchTodosListFailure>(),
    ],
  );

  blocTest<TodosListBloc, TodosListState>(
    'emits [FetchTodosListSuccess] when service returns data.',
    /* GIVEN */
    setUp: () {
      when(() => todoRepository.fetchTodos()).thenAnswer(
        (invocation) async => PageModel(
          total: 10,
          skip: 0,
          limit: 10,
          items: List.filled(10, Fixtures().todo()),
        ),
      );
    },
    build: () => TodosListBloc(repository: todoRepository),
    /** WHEN */
    act: (bloc) => bloc.add(FetchTodosList()),
    /** THEN */
    expect: () => [
      isA<FetchTodosListLoading>(),
      isA<FetchTodosListSuccess>(),
    ],
  );
}
