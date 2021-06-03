import 'package:flutter/material.dart';
import 'package:futureyoutube/photo.dart';


//aqui ao clicar em uma das imagens ou uma das frases nós vamos para essa tela
//porém imagine que eu clique na primeira, ela vai me manda pra essa tela com o mesmo titulo que esta na outra tela
//passando parametro entre telas !

class DetalhePage extends StatelessWidget {
  final Photo photo;

  DetalhePage(this.photo);

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(photo.title!),
      ),
    );
  }
}