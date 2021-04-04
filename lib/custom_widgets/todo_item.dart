import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/controller/controller.dart';
import 'package:todo_list/custom_widgets/custom_text.dart';
import 'package:todo_list/model/todo.dart';

class TodoItem extends StatefulWidget {
  Todo todo;
  Function checkBox;
  TodoItem(this.todo, this.checkBox);

  @override
  _TodoItemState createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  @override
  Widget build(BuildContext context) {
    final _state = Provider.of<Controller>(context);
    return Container(
      child: Row(
        children: [
          Checkbox(
            value: widget.todo.concluido == 1 ? true : false,
            onChanged: (bool value) {
              _state.updateTodoInScreen(widget.todo);
              widget.checkBox();
            },
            activeColor: Colors.black,
            checkColor: Colors.amber,
          ),
          Expanded(
            child: CustomText(
              texto: widget.todo.nome,
              cor: Colors.black,
              bold: true,
              tamanhoFonte: 18,
            ),
          ),
        ],
      ),
    );
  }
}
