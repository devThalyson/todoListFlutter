import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/controller/controller.dart';
import 'package:todo_list/custom_widgets/custom_snackbar.dart';
import 'package:todo_list/custom_widgets/custom_text.dart';
import 'package:todo_list/custom_widgets/custom_text_form.dart';
import 'package:todo_list/model/todo.dart';

class AddTodoScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _state = Provider.of<Controller>(context);

    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        centerTitle: true,
        backgroundColor: Colors.amber,
        title: CustomText(
          texto: "Adicionar Tarefa",
          cor: Colors.black,
          bold: true,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.amber,
        ),
        backgroundColor: Colors.black,
        onPressed: () {
          _addTodo(_state, context);
        },
      ),
      body: _body(),
    );
  }

  _body() {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              child: CustomTextForm(
                controller: _controller,
                dicaCampo: "Tarefa",
                acaoTeclado: TextInputAction.done,
                tipoTeclado: TextInputType.text,
                validator: _validatorTodo,
                suficone: Icon(
                  Icons.today_rounded,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _addTodo(Controller c, BuildContext context) {
    if (!_formKey.currentState.validate()) {
      return;
    }
    Todo todo = Todo();
    todo.nome = _controller.text;
    todo.concluido = 0;
    c.saveTodoInScreen(todo);
    _controller.text = "";
    final snackBar = CustomSnackbar();
    ScaffoldMessenger.of(context).showSnackBar(
      snackBar.build(context),
    );
  }

  String _validatorTodo(String txt) {
    if (txt.isEmpty) {
      return "Preencha o nome da Tarefa";
    }
  }
}
