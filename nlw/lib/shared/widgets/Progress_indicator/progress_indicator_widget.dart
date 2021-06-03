import 'package:flutter/material.dart';
import 'package:nlw/core/core.dart';

//criamos essa pasta "Shared" e a pasta Progress_indicator para deixar nossa Progressbar
//para que podemos compartilhar a mesma ProgressBar em diferentes telas
class ProgressIndicatorWidget extends StatelessWidget {
  //para todas telas utlizar fazemos isso
  final double value;

  const ProgressIndicatorWidget({Key? key, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: value,
      //para colocar a backgroundcolor de branco e a valueColor de verde!!
      backgroundColor: AppColors.chartSecondary,
      valueColor: AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
    );
  }
}
