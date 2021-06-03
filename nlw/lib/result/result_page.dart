import 'package:flutter/material.dart';
import 'package:nlw/challenge/widgets/next_button/next_button_widget.dart';
import 'package:nlw/core/app_images.dart';
import 'package:nlw/core/app_text_styles.dart';
import 'package:share_plus/share_plus.dart';

//tela que vai mostrar os resultados do usuario(quantas questoes acertou)
class ResultPage extends StatelessWidget {
  final String title;
  final int length;
  final int result;

  const ResultPage({
    Key? key,
    required this.title,
    required this.length,
    required this.result,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double
            .maxFinite, //para que o main e o cross seja alinhado corretamente
        padding: EdgeInsets.only(top: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center, //alinha na vertical
          children: [
            Image.asset(AppImages.trophy),
            Column(
              children: [
                Text(
                  "Parabéns!",
                  style: AppTextStyles.heading40,
                ),
                //estamos usando o rich pois nessa frase tem palavras em negrito e palavras sem negrito
                //e o rich nos possibilita colocar alguma estilização nas palavras em especifico que queremos
                SizedBox(
                  height: 16,
                ),
                Text.rich(
                  TextSpan(
                      text: "Você concluiu o ",
                      style: AppTextStyles.body,
                      children: [
                        TextSpan(
                            text:
                                "\n$title", //olha só que interessante para pegar variavel é parecido com o JavaScript porém quando colocamos entre "" e apenas para pegar a variavel e entre {} pegamos a variavel e os atributos que ela contem da classe
                            style: AppTextStyles.bodyBold),
                        TextSpan(
                            text: "\ncom $result de $length acertos.",
                            style: AppTextStyles.body)
                      ]),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            //colocando os botões
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 68),
                      child: NextButtonWidget.purple(
                          label: "Compartilhar",
                          onTap: () {
                            Share.share(
                                'DevQuiz NLW 5 - Flutter: Resultado do Quiz: $title\nObtive: ${result / length}% aproveitamento!');
                          }),
                    )),
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 68),
                      child: NextButtonWidget.white(
                          label: "Voltar ao início",
                          onTap: () {
                            Navigator.pop(context);
                          }),
                    )),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
