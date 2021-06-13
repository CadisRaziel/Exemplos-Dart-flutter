import 'package:doc/efeitos/HomePageYT.dart';
import 'package:flutter/material.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //esse final foi usado no exemplo Animacao_fade
    // final paramTitle = 'Parametro criado na MyHomePage';
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Aprendendo a DOC',
        theme: ThemeData(
          primaryColor: Colors.white,
        ),
        home: HomePage());
  }
}
