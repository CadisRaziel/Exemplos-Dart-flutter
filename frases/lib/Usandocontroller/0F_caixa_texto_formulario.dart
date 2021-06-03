import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CampoTexto extends StatefulWidget {
  @override
  _CampoTextoState createState() => _CampoTextoState();
}

class _CampoTextoState extends State<CampoTexto> {
  //para criar o controller devemos sempre por as variaveis que vai compor ele nessa posição
  //em cima do widget build e do @override
  //TextEditingController = classe responsavel por fazer esse controle
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Capturando texto escrito pelo usuario',
            style: TextStyle(fontStyle: FontStyle.italic)),
        backgroundColor: Colors.pink,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(32),
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Digite um valor',
                hintText: 'coloque um numero de 1 a 10',
              ),
              //enabled: true,
              maxLength: 10,
              //maxLenght é muto usado com o maxLength
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
              //o style vai por aparencia no que o ususario digitar !!
              style: TextStyle(fontSize: 25, color: Colors.purple),
              // obscureText: true,
              /*
              onChanged: (String texto){
                  print('Valor digitado foi $texto');
              },
              */
              onSubmitted: (String texto) {
                print('O valor digitado foi $texto');
              },
              //para pegar os dados que o usuario digita temos que colocar esse controller
              //depois de instanciar a classe la em cima TextEditingController eu coloco a variavel aqui e pronto !
              //agora esse controller é responsavel por capturar o que o usuario digita nesse Textfield !
              controller: _textEditingController,
            ),
          ),
          //capturando o que o usuario digita
          ElevatedButton(
            onPressed: () {
              print('O valor digitado foi aqui ${_textEditingController.text}');
            },
            child: Text('Salvar'),
            style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.purple),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                        side: BorderSide(color: Colors.purple)))),
          )
        ],
      ),
    );
  }
}

//Observações importantes
//TextField cria uma linha aonde o usuario pode digitar !!
//keyboardType: TextInputType.text = para definir o que o usuario vai poder digitar: text, number, emailAdress, datetime
//decoration: InputDecoration = para colocar um estilo no local que o usuario vai digitar, ou seja bordas, icones etc..
//labelText: 'Digite um valor' = vai por uma frase em cima do input
//hintText: 'coloque um numero de 1 a 10' = vai por uma frase dentro do input porém ao usuario clicar ela some !
//enabled: false = desabilita o campo
//enabled: true = Habilita o campo
// maxLength: 10 = a quantidade de caracteres que o usuario pode digitar !
//maxLengthEnforcement: MaxLengthEnforcement.none = none ele deixa ultrapassar o numero de caracteres que eu defini, ou seja se eu defini 10 e colocar 11 ele vai deixar, porém ele vai apresentar em vermelho que esta errado para o usuario !!
//maxLengthEnforcement: MaxLengthEnforcement.enforced = enforced ele nao vai deixar de forma alguma ultrapassar a quantidade de caracteres que definimos !!
//obscureText: true = quando digitar 1 caractere ele vai colocar uma bolinha no lugar tipo quando digitamos senha !
//onChanged = é sempre chamado quando o valor que o usuario digitar for alterado (sempre quando ele alterar o programa vai estar analisando)
//onSubmitted = diferente do onChanged o programa só vai ver o que o usuario alterou quando ele clicar no enter !!!
//resumuindo onChaged é chamado quando o usuario altera o valor no campo sem apertar o ENTER, e o onSubmitted é chamado quando ele apaerta o ENTER apenas (ele pode fazer alterações no campo que o programa nao vai analisar)
//controller = o controller tem acesso ao que o usuario digitou e vai capturar o que ele digitou
