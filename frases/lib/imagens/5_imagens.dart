import 'package:flutter/material.dart';
import 'package:frases/core/app_images.dart';

//repare que eu criei a pasta CORE e dentro dela coloquei a IMAGEM dentro de uma classe
//dentro dessa classe tem STRING STATIC para apenas pegarmos as imagems e colocalar de forma mais facil !!

//LEMBRE-SE DE IR NO PUBSPEC E COLOCAR E SETAR O ASSETS LA !!!

void main() {
  runApp(MaterialApp(
    //debugShowCheckedModeBanner = tira a faixa de debug da tela !!
    debugShowCheckedModeBanner: false,
    title: 'Frases do dia',
    home: Container(             
        child: Image.asset(
    AppImages.goku,
    fit: BoxFit.fill,
        ),
      ),
  ));
}

//Observaçoes sobre widgets

//home = Define estrutura inicial do app
//Container = nao deixa textos longos ou imagens ficarem pra fora da tela, evitando erro !!
//Container = ou seja tudo que eu colcoar dentro dele, ele vai impedir que fique pra fora da tela
//Column = usado para por um item abaixo do outro
//Row = usado para por um item ao lado do outro
//children = é aonde podemos colocar imagens, botoes etc...

//Diferença entre child e children
//Child: Só podemos definir UM UNICO ITEM !!! (exemplo, column, row..)!!!
//Children: Podemos colocar varios conteudos (text, imagens, formularios etc..)!!!
//Ou seja se eu definir um child: Column e logo abaixo um children[varios widgets]
//esses widgets serao objetos do Column !!
