import 'package:flutter/material.dart';
import 'package:nlw/core/app_text_styles.dart';
import 'package:nlw/shared/widgets/Progress_indicator/progress_indicator_widget.dart';

class QuestionIndicatorWidget extends StatelessWidget {
  final int currentPage;
  final int length;
  const QuestionIndicatorWidget(
      {Key? key, required this.currentPage, required this.length})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              "Questão $currentPage",
              style: AppTextStyles.body,
            ),
            Text(
              "de $length",
              style: AppTextStyles.body,
            )
          ]),
          SizedBox(height: 16),
          //colocando a progressbar
          ProgressIndicatorWidget(
              value: currentPage /
                  length), //fazendo essa conta o grafico vai mostrar os resultados na pagina inicial
        ],
      ),
    );
  }
}
