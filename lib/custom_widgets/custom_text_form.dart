import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  final String dicaCampo;
  final Widget icone;
  final bool ativarCampo;

  final Widget suficone;
  final bool fill;

  final Color backGColor;

  final bool desabilitarBorda;

  final TextEditingController controller;
  final TextInputType tipoTeclado;
  final TextInputAction acaoTeclado;

  final FormFieldValidator<String> validator;

  final bool esconderTexto;

  final FocusNode focusNode;
  final FocusNode nextFocus;

  final Function digitado;

  CustomTextForm({
    @required this.dicaCampo,
    this.ativarCampo,
    this.controller,
    this.esconderTexto = false,
    this.validator,
    this.tipoTeclado,
    this.acaoTeclado,
    this.focusNode,
    this.nextFocus,
    this.icone,
    this.backGColor,
    this.fill,
    this.desabilitarBorda,
    this.suficone,
    this.digitado,
  });

  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: esconderTexto,
      validator: validator,
      enabled: ativarCampo,
      onChanged: digitado,
      keyboardType: tipoTeclado,
      textInputAction: acaoTeclado,
      focusNode: focusNode,
      onFieldSubmitted: (String text) {
        if (nextFocus != null) {
          FocusScope.of(context).requestFocus(nextFocus);
        }
      },
      style: TextStyle(),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        fillColor: backGColor,
        filled: fill,
        prefixIcon: icone,
        suffixIcon: suficone,
        hintText: dicaCampo,
        errorStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.red[900],
        ),
        labelStyle: TextStyle(
          fontSize: 19,
          color: Colors.blue,
        ),
        hintStyle: TextStyle(
          fontSize: 19,
          color: Colors.grey[850],
        ),
      ),
    );
  }
}
