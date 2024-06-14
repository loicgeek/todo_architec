import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:todo_architec/shared/data/models/page_model.dart';
import 'package:todo_architec/shared/data/services/service_locator.dart';
import 'package:todo_architec/todo/data/models/todo.dart';
import 'package:todo_architec/todo/data/repositories/todo_repository.dart';

part 'todos_list_event.dart';
part 'todos_list_state.dart';

class TodosListBloc extends Bloc<TodosListEvent, TodosListState> {
  final TodoRepository repository;
  TodosListBloc({required this.repository}) : super(TodosListInitial()) {
    on<FetchTodosList>((event, emit) async {
      try {
        emit(FetchTodosListLoading());
        var response = await repository.fetchTodos();
        emit(FetchTodosListSuccess(data: response));
      } catch (e) {
        print(e);
        emit(FetchTodosListFailure());
      }
    });
  }
}
