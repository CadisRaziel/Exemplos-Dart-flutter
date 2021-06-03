import 'package:flutter/material.dart';
import 'package:rotanomeada/SegundaTela.dart';
import 'package:rotanomeada/TelaPrincipal.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    //fazendo rotas nomeadas
    //ao definir uma / estamos dizendo que essa / é nossa rota Main.dart
    initialRoute: '/',
    routes: {
      '/secundaria': (context) => TelaSecundaria(),
      //posso criar rotas para todas as telas !!
      //é interessante a gente usa um a classe com constantes tipo das imagens para usa-las
      // '/secundaria': (context) => TelaSecundaria(),
      // '/secundaria': (context) => TelaSecundaria(),
      // '/secundaria': (context) => TelaSecundaria(),
    },
    home: TelaPrincipal(),
  ));
}

