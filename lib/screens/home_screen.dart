import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/controller/controller.dart';
import 'package:todo_list/custom_widgets/custom_text.dart';
import 'package:todo_list/custom_widgets/todo_item.dart';
import 'package:todo_list/model/todo.dart';
import 'package:todo_list/screens/add_todo_screen.dart';
import 'package:todo_list/utils/nav.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final _state = Provider.of<Controller>(context);
    _state.getTodosInDb();
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        actions: [
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.black,
            ),
            onPressed: () {
              push(context, AddTodoScreen());
            },
          )
        ],
        title: CustomText(
          texto: "Minhas Tarefas",
          cor: Colors.black,
          bold: true,
        ),
        centerTitle: true,
      ),
      body: _body(_state),
    );
  }

  _body(Controller c) {
    return Observer(
      builder: (context) {
        return c.todos != null
            ? c.todos.length != 0
                ? ListView.builder(
                    itemCount: c.todos.length != null ? c.todos.length : 0,
                    itemBuilder: (context, index) {
                      Todo t = c.todos[index];
                      return Dismissible(
                        background: Container(
                          alignment: Alignment.centerLeft,
                          color: Colors.red,
                          padding: EdgeInsets.all(5),
                          child: CustomText(
                            texto: "DELETAR",
                            bold: true,
                            tamanhoFonte: 18,
                          ),
                        ),
                        direction: DismissDirection.startToEnd,
                        onDismissed: (DismissDirection direction) {
                          c.deleteTodoInScreen(t);
                        },
                        key: UniqueKey(),
                        child: TodoItem(
                          t,
                          c.getTodosInDb,
                        ),
                      );
                    },
                  )
                : Center(
                    child: CustomText(
                      texto: "Você não tem tarefas!",
                      bold: true,
                      tamanhoFonte: 18,
                    ),
                  )
            : Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.black,
                ),
              );
      },
    );
  }
}
