import 'package:flutter/material.dart';
import 'package:todo_list/custom_widgets/custom_text.dart';

class CustomSnackbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SnackBar(
      content: CustomText(
        texto: "Tarefa adicionada com sucesso!",
      ),
      action: SnackBarAction(
        label: 'Fechar',
        onPressed: () {},
      ),
    );
  }
}
