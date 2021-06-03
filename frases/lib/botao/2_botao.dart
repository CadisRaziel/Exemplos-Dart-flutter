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
          ElevatedButton(
              //posso deixar o onPressed: null (para estilizar ele e depois voltar aqui e por o que é preciso)
              //repare que no onPressed eu posso passar uma função anonima, o que é otimo para funções e metoods com funcoes como parametro
              //onPressed = ação que o botao vai fazer quando o usuario clicar nele
              //child = definir o conteudo do botao
              onPressed: () {
                print('Botão Pressionado, vai aparecer no debug console');
              },
              child: Text(
                "Clique aqui",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  decoration: TextDecoration.none,
                ),
              )),
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

//Botoes
//onPressed = ação que o botao vai fazer quando o usuario clicar nele
//child = definir o conteudo do botao
