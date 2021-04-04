// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Controller on ControllerBase, Store {
  final _$todosAtom = Atom(name: 'ControllerBase.todos');

  @override
  List<Todo> get todos {
    _$todosAtom.reportRead();
    return super.todos;
  }

  @override
  set todos(List<Todo> value) {
    _$todosAtom.reportWrite(value, super.todos, () {
      super.todos = value;
    });
  }

  final _$getTodosInDbAsyncAction = AsyncAction('ControllerBase.getTodosInDb');

  @override
  Future getTodosInDb() {
    return _$getTodosInDbAsyncAction.run(() => super.getTodosInDb());
  }

  final _$ControllerBaseActionController =
      ActionController(name: 'ControllerBase');

  @override
  dynamic saveTodoInScreen(Todo t) {
    final _$actionInfo = _$ControllerBaseActionController.startAction(
        name: 'ControllerBase.saveTodoInScreen');
    try {
      return super.saveTodoInScreen(t);
    } finally {
      _$ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic deleteTodoInScreen(Todo t) {
    final _$actionInfo = _$ControllerBaseActionController.startAction(
        name: 'ControllerBase.deleteTodoInScreen');
    try {
      return super.deleteTodoInScreen(t);
    } finally {
      _$ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic updateTodoInScreen(Todo t) {
    final _$actionInfo = _$ControllerBaseActionController.startAction(
        name: 'ControllerBase.updateTodoInScreen');
    try {
      return super.updateTodoInScreen(t);
    } finally {
      _$ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic saveTodoInDb(Todo todo) {
    final _$actionInfo = _$ControllerBaseActionController.startAction(
        name: 'ControllerBase.saveTodoInDb');
    try {
      return super.saveTodoInDb(todo);
    } finally {
      _$ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic updateTodoInDb(Todo todo) {
    final _$actionInfo = _$ControllerBaseActionController.startAction(
        name: 'ControllerBase.updateTodoInDb');
    try {
      return super.updateTodoInDb(todo);
    } finally {
      _$ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic deleteTodoInDb(Todo todo) {
    final _$actionInfo = _$ControllerBaseActionController.startAction(
        name: 'ControllerBase.deleteTodoInDb');
    try {
      return super.deleteTodoInDb(todo);
    } finally {
      _$ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
todos: ${todos}
    ''';
  }
}
