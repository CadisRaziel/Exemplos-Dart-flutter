import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    //debugShowCheckedModeBanner = tira a faixa de debug da tela !!
    debugShowCheckedModeBanner: false,
    title: 'Frases do dia',
    home: Container(
      //fora do child o color preenche toda a tela inclusive a safearea(onde fica a bateria 4G etc..)
      //ou seja é a cor de fundo
      color: Colors.deepPurple,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            ' De segunda a sexta nos vamos estudar flutter, aos sabados e domingos vamos rever dart ',
            style: TextStyle(
              fontSize: 35.5,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold,
              letterSpacing: 5,
              wordSpacing: 5,
              decoration: TextDecoration.none,
              decorationColor: Colors.black87,
              decorationStyle: TextDecorationStyle.solid,
              color: Colors.white,
            ),
          ),
        ],
      ),
    ),
  ));
}

//Observaçoes sobre widgets

//mainAxisAlignment = alinhamento principal (Row = horizontal - , Column = vertical | )
//MainAxisAlignment.center = centro da tela
//MainAxisAlignment.end = começa em baixo da tela
//MainAxisAlignment.start = começa em cima da tela
//MainAxisAlignment.spaceAround = espaçamentos internos são maiores que espaçamentos externos
//MainAxisAlignment.spaceBetween = poe espaçamento entre os itens porém deixa eles colados nas bordas (redistrubui os espaços)
//MainAxisAlignment.spaceEvenly = alinha uniformemente, organiza os espaços de formas iguais ate ocupar todo espaçamento(bom para rotação de tela)

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

//Dentro do Text podemos colcoar:
//fontSize = aceita valor numerico e booleano(ele é um num)
//fontWeight: FontWeight.bold, = os w100, w200 define o tipo de espessua da fonte
//letterSpacing: 5 = espaçamento entre as letras
//wordSpacing: 5 = espaçamento entre as palavras

//decoration: TextDecoration.none = tira as linhas em baixo das frases
//decoration: TextDecoration.lineThrough = coloca uma linha no meio da frase
//decoration: TextDecoration.overline = coloca as linhas em cima das frases tipo underline
//decoration: TextDecoration.underline = coloca as linhas em baixo das frases tipo underline

//decorationStyle: TextDecorationStyle.solid = deixa uma linha grossa no TextDecoration
//decorationStyle: TextDecorationStyle.dashed = deixa uma linha pontilhada igual de recorte no TextDecoration
//decorationStyle: TextDecorationStyle.dotted = deixa uma linha pontilhada com pontos no TextDecoration
//decorationStyle: TextDecorationStyle.double = deixa duas linha no TextDecoration
//decorationStyle: TextDecorationStyle.wavy = deixa uma linha de onda no TextDecoration

//decorationColor: Colors.black87 = a cor das linhas do TextDecoration !
