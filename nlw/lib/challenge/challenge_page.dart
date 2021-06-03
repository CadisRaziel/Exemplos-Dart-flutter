import 'package:flutter/material.dart';
import 'package:nlw/challenge/challenge_controller.dart';
import 'package:nlw/challenge/widgets/next_button/next_button_widget.dart';
import 'package:nlw/challenge/widgets/question_indicator/question_indicator_widget.dart';
import 'package:nlw/challenge/widgets/quiz/quiz_widget.dart';
import 'package:nlw/result/result_page.dart';
import 'package:nlw/shared/Models/question_model.dart';

//tela das perguntas
class ChallengePage extends StatefulWidget {
  final List<QuestionModel> questions;
  final String title;
  ChallengePage({Key? key, required this.questions, required this.title})
      : super(key: key);

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final controller = ChallengeController(); //para a tela das questoes
  final pageController =
      PageController(); //para que mude o titulo de questão junto com as telas de questoes (e o progress bar tambem)
  @override
  void initState() {
    //sempre que tem uma modificação do pageview na nossa lista devemos colocar o addListener
    pageController.addListener(() {
      controller.currentPage = pageController.page!.toInt() +
          1; //colocamos +1 porque o indice começa no 0 e queremos que começe no 1 (ou seja questão 1, questão 2)
    });
    super.initState();
  }

  void nextPage() {
    if (controller.currentPage <
        widget.questions
            .length) //se a pagina atual for menor que as questoes ele não avança(ou seja quando chegar no final ele nao tenta acessar uma nova pagina ou quando da os 3 segundos ele não avança)
      pageController.nextPage(
          //repare que para ir para proxima pagina é só eu colocar nextPage que ja é nativo do flutter
          duration: Duration(milliseconds: 150),
          curve: Curves.linear);
  }

  void onSelected(bool value) {
    if (value) {
      controller.qtdAnwserRight++;
    }
    nextPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(86),
        child: SafeArea(
            top: true,
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start, //posicionando o BackButton
              children: [
                //para voltar na tela que estava(repare que nao preciso passar rota)
                BackButton(),

                //poderia colcoar um IconButton ao invez do BackButton()
                //IconButton(icon: Icon(Icons.close), onPressed: () {Navigator.pop(context)};

                //colocamos esse codigo ValueListenableBuilder pois o Scaffold ali em cima fica rebuildando
                //isso pode travar o app caso ele seja mais complexo
                //para evitar isso colocamos esse codigo
                //e evitamos o uso do setState controller.currentPageNotifier.addListener()
                ValueListenableBuilder<int>(
                  valueListenable: controller.currentPageNotifier,
                  builder: (context, value, _) => QuestionIndicatorWidget(
                    currentPage: value,
                    length: widget.questions.length,
                  ),
                )
              ],
            )), //safearea para nao ficar na statusbar
      ),
      body: PageView(
        //caso eu queira travar o scroll do PageView pro usuario apenas usar o botão de pular eu faço isso
        //physics: NeverScrollableScrollPhysics(),

        controller: pageController,
        children: widget.questions
            .map(
              (e) => QuizWidget(
                question: e,
                onSelected: onSelected,
              ),
            )
            .toList(),
      ),
      //colocando o botão
      bottomNavigationBar: SafeArea(
        //SafeArea para não pegar na borda das telas na parte debaixo principalmente em IOS (no android nao da muita diferença)
        child: Padding(
            padding: const EdgeInsets.all(20),
            child: ValueListenableBuilder<int>(
                valueListenable: controller.currentPageNotifier,
                builder: (context, value, _) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        if (value <
                            widget.questions
                                .length) //o pular só vai ser mostrando quando tiver mais questoes para pular, quando chegar ao final ele some
                          Expanded(
                              child: NextButtonWidget.white(
                            label: "Pular",
                            onTap: nextPage,
                          )),
                        if (value == widget.questions.length)
                          Expanded(
                              child: NextButtonWidget.green(
                            label: "Confirmar",
                            onTap: () {
                              Navigator.pushReplacement(
                                  //pushReplacement vai voltar para tela de inicio
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ResultPage(
                                      result: controller.qtdAnwserRight,
                                      title: widget.title,
                                      length: widget.questions.length,
                                    ),
                                  )); //vai voltar para a homepage
                            },
                          ))
                      ],
                    ))),
      ),
    );
  }
}
