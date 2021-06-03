//nós iremos construir os modulos de Model(database) na pasta Shared ou seja
//os models serão compartilhado com o projeto todo !!

import 'dart:convert';

import 'awnser_model.dart';

class QuestionModel {
  final String title; //titulo da questão
  final List<AwnserModel> //lista de respostas
      awnsers; //repare que o AwnserModel esta criado no awnser_model.dart !!!

  //estamos passando o required para ser obrigatorio o titulo e as perguntas(awnsers)
  QuestionModel({required this.title, required this.awnsers})
      : assert(awnsers.length ==
            4); //no caso o 4 são 4 respostas que vão ser apresentadas !! (ou seja tem que criar 4 respostas para criar o layout)
  //utilizamos o assert() para garantir que as que as awnsers no layout o tamanho tem que ser igual a 4 para deixar um padrão

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'awnsers': awnsers.map((x) => x.toMap()).toList(),
    };
  }

  factory QuestionModel.fromMap(Map<String, dynamic> map) {
    return QuestionModel(
        title: map['title'],
        awnsers: List<AwnserModel>.from(
            map['awnsers']?.map((x) => AwnserModel.fromMap(x))));
  }

  String toJson() => json.encode(toMap());

  factory QuestionModel.fromJson(String source) =>
      QuestionModel.fromMap(json.decode(source));
}
