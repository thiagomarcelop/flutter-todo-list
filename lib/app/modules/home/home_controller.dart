import 'package:flutter_todo_list/app/modules/home/models/todo_model.dart';
import 'package:flutter_todo_list/app/modules/home/repositories/todo_repository_interface.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final ITodoRepository todoRepository;

  @observable
  ObservableStream<List<TodoModel>> todoList;

  _HomeControllerBase(ITodoRepository this.todoRepository) {
    getList();
  }

  @action
  getList() {
    todoList = todoRepository.getTodos().asObservable();
  }

  save(TodoModel model) => todoRepository.save(model);

  delete(TodoModel model) => todoRepository.delete(model);
}
