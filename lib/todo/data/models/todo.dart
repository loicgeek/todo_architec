class Todo {
  int id;
  String todo;
  bool completed;
  int userId;
  Todo({
    required this.id,
    required this.todo,
    required this.completed,
    required this.userId,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'todo': todo,
      'completed': completed,
      'userId': userId,
    };
  }

  factory Todo.fromJson(Map<String, dynamic> map) {
    return Todo(
      id: map['id'] as int,
      todo: map['todo'] as String,
      completed: map['completed'] as bool,
      userId: map['userId'] as int,
    );
  }

  @override
  bool operator ==(covariant Todo other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.todo == todo &&
        other.completed == completed &&
        other.userId == userId;
  }

  @override
  int get hashCode {
    return id.hashCode ^ todo.hashCode ^ completed.hashCode ^ userId.hashCode;
  }
}
