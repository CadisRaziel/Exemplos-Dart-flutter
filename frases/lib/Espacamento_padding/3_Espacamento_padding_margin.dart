import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
   //debugShowCheckedModeBanner = tira a faixa de debug da tela !!
    debugShowCheckedModeBanner: false,
    title: 'Frases do dia',
    home: Container(
      //padding vai por espaçamento dentro da tela
      //ou seja EdgeInsets.all(30) vai dar 30 de espaçamento em todos os cantos da tela deixando o texto mais no centro
      //all = em todos os cantos
      //fromLTRB = especifico se quero no lado esquerdo, no top, no lado direito, em baixo      
      //padding: EdgeInsets.all(30),
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),

      //margin define espaçamento externo
      //repare nas bordas, o margin afeta diretamente ela ou seja a borda que vai pegar essa margin
      //all = para todos os lados
      //fromLTRB = lados especificos igual acima no padding
      //only = nos que espeficiamos o lado
      margin: EdgeInsets.only(top: 10, bottom: 10),
      //margin: EdgeInsets.all(30),

      //posso defirnir um decoration para o container
      //Boxdecoration = me permite colocar borda no container
      decoration: BoxDecoration(
        border: Border.all(width: 3, color: Colors.white)
      ),   
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,        
        children: [
          //colocando padding diretamente no widget
          Text('T1'),

          Padding(padding: EdgeInsets.all(30),
          child: Text('T2'),
          ),
         
          Text('T3')

          // Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500',        
          // //textAlign.justify = vai deixar o texto colado nas bordas
          // textAlign: TextAlign.justify,
          // style: TextStyle(
          //   fontSize: 15,
          // ),
          // ),
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


//espaçamento no container