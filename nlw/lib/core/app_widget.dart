import 'package:flutter/material.dart';
import 'package:nlw/Splash/splash_page.dart';

//podemos usar tanto o material que é do google ou o cupertino do ios para criar components
//porém o material é melhor

//StatelessWidget = não tem estado ou seja, vai ser renderizado e pronto dali pra frente ele não altera mais

//AQUI EU VOU COLOCAR TODAS AS NOSSAS TELAS CRIADAS, REPARE ABAIXO(ESSA É O title, E A SPLASHSCREEN É O home)
//PORQUE ESSE MODULO SERÁ CHAMADO PELO Main.dart para ser renderizado !!

class AppWidget extends StatelessWidget {
  @override

  //o build é sempre responsavel para criar os componentes
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "DevQuiz",
      home: SplashPage(),
    );
  }
}
