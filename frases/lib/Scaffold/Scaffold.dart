import 'package:flutter/material.dart';

//Scaffold = esqueleto(estrutura base)
//appBar = conteudo abaixo de aonde fica a bateria, horario etc..(menu da parte de cima)
//body = corpo
//bottomNavigationBar = menu da parte debaixo

void main() {
  runApp(MaterialApp(
    //debugShowCheckedModeBanner = tira a faixa de debug da tela !!
    debugShowCheckedModeBanner: false,    
    home: Scaffold(
      appBar: AppBar(
        title: Text('Instagram'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Text('Conteúdo principal'),
        ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.pink,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Row(children: [
            Text('Texto 1'),
            Text('Texto 2'),
            Text('Texto 3'),
          ],),
        ),
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
