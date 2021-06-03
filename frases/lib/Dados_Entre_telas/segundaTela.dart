import 'package:flutter/material.dart';

class TelaSecundaria extends StatefulWidget {

  //veja que interessante, eu crio o construtor
  //e coloco o valor que quero passar
  //no caso uma string
  //quando eu finalizo o construtor, automaticamente a TelaSecundaria instanciada na 1 tela
  //ja pede o parametro com o valor !

  String? valor;

  //para passar os dados precisamos de um construtor
  TelaSecundaria({this.valor});

  @override
  _TelaSecundariaState createState() => _TelaSecundariaState();
}

class _TelaSecundariaState extends State<TelaSecundaria> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Tela Secundaria'),
        backgroundColor: Colors.orange,
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: [
            //repare que o 'widget' tem o TelaSecundaria (colocamos widget pois ele consegue acessar diretamente a String valor, 'com o this nao conseguimos')
            //com isso consigo apresentar o valor criado aqui na tela secundaria
            //porém passado como parametro na primeira tela
            Text('Valor passado: ${widget.valor}')
            ],
        ),
      ),
    );
  }
}