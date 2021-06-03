//esse modulo é criado para pegar os dados do usuario, nome, score, foto...

import 'dart:convert';

class UserModel {
  final String name;
  final String photoUrl;
  final int score; //para pegar um score de 0 a 100
  //Obs: quando criamos a estrutura acima, clique no score ou name ou photoUrl e aperte CTLR + . e clique para criar o "Create Constructor "

  //que ai ele cria essa linha de codigo automaticamente \/
  UserModel({required this.name, required this.photoUrl, this.score = 0});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'photoUrl': photoUrl,
      'score': 'score',
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        name: map['name'], photoUrl: map['photoUrl'], score: map['score']);
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
