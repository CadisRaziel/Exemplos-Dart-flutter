//nós iremos construir os modulos de Model(database) na pasta Shared ou seja
//os models serão compartilhado com o projeto todo !!

//repare que eu criei a estutura completa do awnser_model.dart primeiro, depois passei para o question_model.dart e só depois eu vim para o quiz_model.dart !!
//porém eu deixei os 3 criados com a estrutura inicial
import 'dart:convert';

import 'package:nlw/shared/Models/question_model.dart';

//ao invez de criar uma classe, vamos criar um enum para o "Level"
enum Level { facil, medio, dificil, perito }

//como o Level esta num "enum" eu não posso utilizar .toMap nele la em baixo na estrutura do codigo, pra isso preciso fazer isso\/
extension LevelStringExt on String {
  //vamos fazer uma extensão do nosso enum para ele devolver o parse(tipo o bodyparse do nodejs)
  //ou seja fizemos um parse com um map, o map esta entre {}, se vier "facil" : devolva Level.facil (os : é para devolver)
  Level get parse => {
        "facil": Level.facil,
        "medio": Level.medio,
        "dificil": Level.dificil,
        "perito": Level.perito
      }[this]!; //o this representa a String que eu to passando, ou seja a String "LevelStringExt on String"
}

extension LevelExt on Level {
  //vamos fazer uma extensão do nosso enum para ele devolver o parse(tipo o bodyparse do nodejs)
  //ou seja fizemos um parse com um map, o map esta entre {}, se vier "facil" : devolva Level.facil (os : é para devolver)
  String get parse => {
        Level.facil: "facil",
        Level.medio: "medio",
        Level.dificil: "dificil",
        Level.perito: "perito"
      }[this]!; //o this representa a String que eu to passando, ou seja a String "LevelStringExt on String"
}

class QuizModel {
  final String title;
  final List<QuestionModel> //lista de questoes
      questions; //repare que os questions estão criados aqui "question_model.dart"
  final Level level; //level das quiz
  final int
      questionAnswered; //quantas questões foram respondidas exemplo: 3 de 10
  final String imagem;

//criando um construtor com parametros nomiados !! fizemos isso nos 3 modulos de model
//para por required lembre-se sempre de por ({})
  QuizModel(
      {required this.title,
      required this.questions,
      required this.level,
      this.questionAnswered = 0, //igual a 0 só para teste
      required this.imagem});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'questions': questions.map((x) => x.toMap()).toList(),
      'questionAnswered': questionAnswered,
      'imagem': imagem,
      'level': level.parse,
    };
  }

  factory QuizModel.fromMap(Map<String, dynamic> map) {
    return QuizModel(
      title: map['title'],
      questions: List<QuestionModel>.from(
          map['questions']?.map((x) => QuestionModel.fromMap(x))),
      questionAnswered: map['questionAnswered'],
      imagem: map['imagem'],
      level: (map['level']).toString().parse,
    );
  }

  String toJson() => json.encode(toMap());

  factory QuizModel.fromJson(String source) =>
      QuizModel.fromMap(json.decode(source));
}
