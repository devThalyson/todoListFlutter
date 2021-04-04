class Todo {
  int id;
  String nome;
  int concluido;

  Todo({this.id, this.nome, this.concluido});

  Todo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    concluido = json['concluido'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['concluido'] = this.concluido;
    return data;
  }
}
