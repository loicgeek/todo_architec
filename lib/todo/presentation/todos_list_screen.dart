import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_architec/shared/data/services/service_locator.dart';
import 'package:todo_architec/todo/business_logic/todos_list/todos_list_bloc.dart';
import 'package:todo_architec/todo/data/repositories/todo_repository.dart';

class TodosListScreen extends StatefulWidget {
  const TodosListScreen({super.key});

  @override
  State<TodosListScreen> createState() => _TodosListScreenState();
}

class _TodosListScreenState extends State<TodosListScreen> {
  late TodosListBloc todosListBloc;
  @override
  void initState() {
    todosListBloc = TodosListBloc(repository: getIt.get<TodoRepository>());
    todosListBloc.add(FetchTodosList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todos"),
      ),
      body: BlocBuilder<TodosListBloc, TodosListState>(
        bloc: todosListBloc,
        builder: (context, state) {
          if (state is FetchTodosListLoading || state is TodosListInitial) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is FetchTodosListFailure) {
            return SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      todosListBloc.add(FetchTodosList());
                    },
                    icon: const Icon(Icons.refresh),
                  )
                ],
              ),
            );
          }
          if (state.data != null) {
            return ListView.builder(
                itemCount: state.data!.items.length,
                itemBuilder: (context, index) {
                  var item = state.data!.items[index];
                  return ListTile(
                    title: Text("#${item.id}"),
                    subtitle: Text("${item.todo}"),
                  );
                });
          }
          return Container();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
