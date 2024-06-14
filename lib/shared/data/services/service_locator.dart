import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_architec/todo/data/repositories/todo_repository.dart';
import 'package:todo_architec/todo/data/services/todo_service.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingleton<TodoService>(TodoService(http: getIt.get<Dio>()));
  getIt.registerSingleton<TodoRepository>(
    TodoRepository(
      todoService: getIt.get<TodoService>(),
    ),
  );
}
