import 'dart:math';

import 'package:api/Home.dart';
import 'package:api/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 5)).then((_) => Navigator.pushReplacement(
        //pushReplacement = para impedir que o app volte para a tela de splash !! (a splash deve aparecer apenas 1 vez, que é na hora que abre o app)
        context,
        MaterialPageRoute(
          builder: (context) => Home(),
        )));
    return Scaffold(
      body: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('API', style: AppTextStyles.title)],
        ),
        //preciso por o height e o width como infinity para que as cores pegue a tela toda
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: SweepGradient(
              startAngle: 0.0,
              endAngle: pi * 2.0,
              colors: [
                //é preciso ter 5 cores pra ter um efeito de desfoce nas laterias dela !! (sendo 2 cores iguais na parte debaixo)
                Colors.blue, //fica em baixo
                Colors.green, //fica do lado esquerdo
                Colors.red, //fica em cima
                Colors.yellow, //fica do lado direito
                Colors.blue //fica em baixo
              ],
              transform: GradientRotation(pi / 2.0)),
        ),
      ),
    );
  }
}
