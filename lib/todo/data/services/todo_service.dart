import 'package:dio/dio.dart';

class TodoService {
  Dio http;
  TodoService({required this.http});

  Future<Map<String, dynamic>> fetchTodos() async {
    var response = await http.get("https://dummyjson.com/todos");
    return response.data;
  }
}
