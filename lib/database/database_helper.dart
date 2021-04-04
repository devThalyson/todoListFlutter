import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_list/model/todo.dart';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper;
  static Database _database;

  String todoTable = "todo";
  String colId = "id";
  String colNome = "nome";
  String colConcluido = "concluido";

  DatabaseHelper._createInstance();

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createInstance();
    }
    return _databaseHelper;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + "todos.db";
    var todosDatabase =
        await openDatabase(path, onCreate: _createDb, version: 2);
    return todosDatabase;
  }

  _createDb(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $todoTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, '
        '$colNome TEXT, $colConcluido INTEGER)');
  }

  //insert todo
  Future<int> insertTodo(Todo todo) async {
    Database db = await this.database;

    var resultado = await db.insert(todoTable, todo.toJson());

    return resultado;
  }

  //get todos
  Future<List<Todo>> getTodos() async {
    Database db = await this.database;

    var resultado = await db.query(todoTable);

    List<Todo> lista = resultado.isNotEmpty
        ? resultado.map((e) => Todo.fromJson(e)).toList()
        : [];
    return lista;
  }

  //update todo
  Future<int> updateTodo(Todo todo) async {
    var db = await this.database;

    var resultado = await db.update(
      todoTable,
      todo.toJson(),
      where: '$colId = ?',
      whereArgs: [todo.id],
    );

    return resultado;
  }

  //delete todo
  Future<int> deleteTodo(int id) async {
    var db = await this.database;
    int resultado =
        await db.delete(todoTable, where: "$colId = ?", whereArgs: [id]);
    return resultado;
  }

  //close db
  Future close() async {
    Database db = await this.database;
    db.close();
  }
}
