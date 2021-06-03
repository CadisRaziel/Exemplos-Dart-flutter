import 'package:flutter/material.dart';
import 'package:nlw/core/core.dart';
import 'package:nlw/home/widgets/chart/chart_widget.dart';

//aqui vamos criar o card que fica sobre a Appbar mostrando "Resultado" e "Vamos começar"
class ScoreCardWidget extends StatelessWidget {
  final double percent;
  const ScoreCardWidget({Key? key, required this.percent}) : super(key: key);

//esse card tem que ser renderizado no app_bar_widget
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Container(
          //altura, bordas e cor do card
          height: 136,
          decoration: BoxDecoration(
              color: AppColors.white, borderRadius: BorderRadius.circular(15)),

          //Expanded para representar o grafico
          //expanded é para ele ser expandido na tela e nao quebrar ela ou dar error
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    flex: 1,
                    child: ChartWidget(
                      percent: percent,
                    )), //aqui estamos renderizando o modulo chart_widget (que vai aparecer a progress bar)
                //colocando os textos do card
                Expanded(
                  flex: 3,
                  //para por o padding clique sobre Column e clique na lampada amarela e click no padding
                  //ele ja vai posicionar na posição correta
                  child: Padding(
                    padding: const EdgeInsets.only(left: 24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Vamos começar", style: AppTextStyles.heading),
                        Text("Complete os desafios e avance em conhecimento",
                            style: AppTextStyles.body)
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
