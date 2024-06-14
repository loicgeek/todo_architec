part of 'todos_list_bloc.dart';

class TodosListState extends Equatable {
  const TodosListState({this.data});
  final PageModel<Todo>? data;

  @override
  List<Object?> get props => [data];
}

final class TodosListInitial extends TodosListState {}

class FetchTodosListLoading extends TodosListState {}

class FetchTodosListSuccess extends TodosListState {
  const FetchTodosListSuccess({super.data});
}

class FetchTodosListFailure extends TodosListState {}
