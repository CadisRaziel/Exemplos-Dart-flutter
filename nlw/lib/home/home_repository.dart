import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:nlw/shared/Models/quiz_model.dart';
import 'package:nlw/shared/Models/user_model.dart';

class HomeRepository {
  Future<UserModel> getUser() async {
    //lendo o json
    final response = await rootBundle.loadString("assets/database/user.json");
    final user = UserModel.fromJson(response);
    return user;
  }

  Future<List<QuizModel>> getQuizzes() async {
    final response =
        await rootBundle.loadString("assets/database/quizzes.json");
    final list = jsonDecode(response) as List;
    final quizzes = list
        .map((e) => QuizModel.fromMap(e))
        .toList(); //como criei um list aqui preciso por ali na frente do Future
    return quizzes;
  }
}
