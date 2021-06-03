//quando falamos de criar algum controlador normalmente vamos fazer algumas chamadas, algumas interações
//porém para criar o controller precisamos criar algumas variaveis para armazenar as coisas

// O controller é responsavel -> pelo estado da nossa tela ou seja
// EXEMPLO: imagine que eu defini um botão circular para quando esta em standby sem interação do usuario
// e o mesmo botão quando o usuario clica ele fica retangular
// o controller é responsavel por deixar ele em standby circular !!

// Quando estamos criando uma aplicação devemos nos preocupar com 3 coisas :
// * O estado de sucesso
// * O estado de erro
// * O estado de loading

import 'package:flutter/foundation.dart'; //ValueNofier usa o fundation
import 'package:nlw/home/home_repository.dart';
import 'package:nlw/home/home_state.dart';
import 'package:nlw/shared/Models/quiz_model.dart';
import 'package:nlw/shared/Models/user_model.dart';

class HomeController {
  final stateNotifier = ValueNotifier<HomeState>(HomeState.empty);
  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;

  //vai abordar
  //*USUARIO
  //*QUIZES
  UserModel? user; //iniciamos ele como Nullo "?"
  List<QuizModel>? quizzes; //iniciamos ele como nullo "?"
  //precisamos iniciar eles como nulos pois no inicio precisamos buscar informação de algum lugar

  //instanciando o repository
  final repository = HomeRepository();

  void getUser() async {
    state = HomeState.loading;
    user = await repository.getUser();
    state = HomeState.sucess;
  }

  void getQuizzes() async {
    state = HomeState.loading;
    quizzes = await repository.getQuizzes();
    state = HomeState.sucess;
  }
}
