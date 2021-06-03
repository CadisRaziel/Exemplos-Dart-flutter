import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    //debugShowCheckedModeBanner = tira a faixa de debug da tela !!
    debugShowCheckedModeBanner: false,
    title: 'Frases do dia',
    home: Container(
      margin: EdgeInsets.only(top: 60),

      //posso defirnir um decoration para o container
      //Boxdecoration = me permite colocar borda no container
      decoration:
          BoxDecoration(border: Border.all(width: 3, color: Colors.white)),
      child: Row(
        //mainAxisAlignment = alinhamento principal (Row = horizontal - , Column = vertical | )
        //MainAxisAlignment.center = centro da tela
        //MainAxisAlignment.end = começa em baixo da tela
        //MainAxisAlignment.start = começa em cima da tela
        //MainAxisAlignment.spaceAround = espaçamentos internos são maiores que espaçamentos externos
        //MainAxisAlignment.spaceBetween = poe espaçamento entre os itens porém deixa eles colados nas bordas (redistrubui os espaços)
        //MainAxisAlignment.spaceEvenly = alinha uniformemente, organiza os espaços de formas iguais ate ocupar todo espaçamento(bom para rotação de tela)
        mainAxisAlignment: MainAxisAlignment.center,

        //cossAxisAligment = cruza o eixo principal que é o main
        // imagine uma cruz, na Column o main é a tabua em pé e o cross é a tabua deitada      
        // imagine uma cruz, na Row o main é a tabua em deitada e o cross é a tabua em pé         
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('T1', style: TextStyle(decoration: TextDecoration.none)),
          Text('T2', style: TextStyle(decoration: TextDecoration.none)),
          Text('T3', style: TextStyle(decoration: TextDecoration.none)),
        ],
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
