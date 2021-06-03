import 'dart:convert';

//nós iremos construir os modulos de Model(database) na pasta Shared ou seja
//os models serão compartilhado com o projeto todo !!

class AwnserModel {
  final String title; //titulo da resposta
  final bool isRight; //se a pergunta esta certa

//criando um constructor nomiado
  AwnserModel({
    required this.title,
    this.isRight = false,
  }); //com o required é obrigado a passar um titulo

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'isRight': isRight,
    };
  }

  factory AwnserModel.fromMap(Map<String, dynamic> map) {
    return AwnserModel(
      title: map['title'],
      isRight: map['isRight'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory AwnserModel.fromJson(String source) =>
      AwnserModel.fromMap(json.decode(source));
}

//se eu nao coloco o required eu teria que por um String? e um bool?
//e com isso eu poderia deixar o titulo ser nulo ou a resposta nula, e nao queremos isso
