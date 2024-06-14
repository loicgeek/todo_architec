part of 'todos_list_bloc.dart';

@immutable
sealed class TodosListEvent {}

class FetchTodosList extends TodosListEvent {}
