import 'package:mobx/mobx.dart';
import 'package:todo_list/database/database_helper.dart';
import 'package:todo_list/model/todo.dart';
part 'controller.g.dart';

class Controller = ControllerBase with _$Controller;

abstract class ControllerBase with Store {
  DatabaseHelper db = DatabaseHelper();

  @observable
  List<Todo> todos;

  @action
  saveTodoInScreen(Todo t) {
    saveTodoInDb(t);
    getTodosInDb();
  }

  @action
  deleteTodoInScreen(Todo t) {
    deleteTodoInDb(t);
    getTodosInDb();
  }

  @action
  updateTodoInScreen(Todo t) {
    t.concluido = t.concluido == 1 ? 0 : 1;

    updateTodoInDb(t);
  }

  @action
  saveTodoInDb(Todo todo) {
    db.insertTodo(todo);
    print("Todo Salva");
  }

  @action
  getTodosInDb() async {
    todos = await db.getTodos();
    print("Todos carregadas");
  }

  @action
  updateTodoInDb(Todo todo) {
    db.updateTodo(todo);
    print("Todo atualizada");
  }

  @action
  deleteTodoInDb(Todo todo) {
    db.deleteTodo(todo.id);
    print("Todos deletada");
  }
}
