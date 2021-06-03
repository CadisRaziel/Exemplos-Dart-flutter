import 'package:flutter/material.dart';
import 'package:nlw/challenge/challenge_page.dart';
import 'package:nlw/core/app_colors.dart';
import 'package:nlw/home/home_controller.dart';
import 'package:nlw/home/home_state.dart';
import 'package:nlw/home/widgets/appbar/app_bar_widget.dart';
import 'package:nlw/home/widgets/level_button/level_button_widget.dart';
import 'package:nlw/home/widgets/quiz_card/quiz_card_widget.dart';

//repare que na home page vamos colocar o StateFulWidget pois o usuario vai interagir com ela e itens serão alterado

class HomePage extends StatefulWidget {
  //quando coloco ? estou dizendo que pode ser nullo
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //colocando o Controller !!
  final controller = HomeController();

  //para garantir que nao tem erro de nullo na hora de usar o controller
  @override
  void initState() {
    super.initState();
    controller.getUser();
    controller.getQuizzes();
    controller.stateNotifier.addListener(() {
      //toda vez que tiver uma modificação o addListener vai dar um setState pra atualizar
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (controller.state == HomeState.sucess) {
      return Scaffold(
          //precisamos criar um codigo para por dentro da AppBarWidget que é o "PreferredSizeWidget" que é obrigatorio
          //pois esse PreferredSizeWidget faz com que deixe ela em um tamanho fixo e quando tiver scroll só sera feita abaixo
          appBar: AppBarWidget(
            user: controller.user!,
          ),

          //colocando todos os botões em uma linha
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Column(
              children: [
                //colocando espaçamento entre os botoes e o score_card
                SizedBox(height: 25),
                Row(
                  //colocando espaçamento
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LevelButtonWidget(label: "Fácil"),
                    LevelButtonWidget(label: "Médio"),
                    LevelButtonWidget(label: "Difícil"),
                    LevelButtonWidget(label: "Perito"),
                  ],
                ),
                //renderizando o card (e colocando um depois do outro ao invez de um abaixo do outro)
                SizedBox(height: 25),
                Expanded(
                    child: GridView.count(
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  crossAxisCount: 2,
                  children: controller.quizzes!
                      .map((e) => QuizCardWidget(
                            title: e.title,
                            percent: e.questionAnswered / e.questions.length,
                            completed:
                                "${e.questionAnswered}/${e.questions.length}",
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ChallengePage(
                                            questions: e.questions,
                                            title: e.title,
                                          )));
                            },
                          ))
                      .toList(),
                ))
              ],
            ),
          ));
    } else {
      return Scaffold(
        body: Center(
            child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen),
        )),
      );
    }
  }
}
