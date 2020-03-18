import 'package:flutter_todo_list/app/modules/home/models/todo_model.dart';

abstract class ITodoRepository {
  Stream<List<TodoModel>> getTodos();

  Future save(TodoModel model);

  Future delete(TodoModel model);
}