import 'dart:math';

import 'package:flutter/material.dart';
import 'package:jokenpo/core/app_images.dart';
import 'package:jokenpo/core/app_text_styles.dart';


//criamos um stafetul pois vamos alterar os dados

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  //essa imagem padrão ela vai ser alterada a todo momento, então é por isso que precisamos por ela em uma variavel
  //para podermos manipular ela em metodos
  var _imagemApp = AssetImage(AppImages.padrao);

  var mensagem = 'Escolha uma opção abaixo';
  
  //repare que nao tem void ou string ou int antes do 'opcaoSelecionada' pois essa é uma função ANONIMA !!!
  _opcaoSelecionada(String escolhaUsuario) {
    var opcoes = ['pedra', 'papel', 'tesoura'];

    //numero = vai gerar uma opcao aleatoria !!(ou seja o usuario vai competir contra o app ou seja temos que por itens randomicos)
    var numero = Random().nextInt(3);
    //3 valores pois é a quantidade de elemento que o 'opcoes' tem

    var escolhaApp = opcoes[numero];

    //exibição da imagem escolhida pelo app
    switch (escolhaApp) {
      case 'pedra':
        setState(() {
          this._imagemApp = AssetImage(AppImages.pedra);
        });
        break;
      case 'papel':
        setState(() {
          this._imagemApp = AssetImage(AppImages.papel);
        });
        break;
      case 'tesoura':
        setState(() {
          this._imagemApp = AssetImage(AppImages.tesoura);
        });
        break;
    } 

    //validação do ganhador
    if(
       //usuario ganhador
       (escolhaUsuario == 'pedra' && escolhaApp == 'tesoura')
       ||
       (escolhaUsuario == 'tesoura' && escolhaApp == 'papel')
       ||
       (escolhaUsuario == 'papel' && escolhaApp == 'pedra')
    ) {      
      setState(() {
        this.mensagem = 'Parabéns você ganhou xD \n\n *você escolheu $escolhaUsuario*';
      });
    } else if (
      //App ganhador
       (escolhaApp == 'pedra' && escolhaUsuario == 'tesoura')
       ||
       (escolhaApp == 'tesoura' && escolhaUsuario == 'papel')
       ||
       (escolhaApp == 'papel' && escolhaUsuario == 'pedra')
    ) {
       setState(() {
        this.mensagem = 'O App ganhou de você =( \n\n *você escolheu $escolhaApp*';
      });      
    } else {
      //se der empate
         setState(() {
        this.mensagem = 'Empatamos (º)> \n\n *você escolheu $escolhaUsuario*';
      });
    }
        

  }

  @override
  //Esse widget build é responsavel por criar a interface
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //appTextStyle é a classe criada dentro de 'core' aonde esta nossa fonte
        title: Text('Jokenpo', style: AppTextStyles.titleJP),
        backgroundColor: Colors.yellowAccent.shade700,
      ),
      body: Container(
        margin: EdgeInsets.only(left: 30, top: 50, right: 30, bottom: 50),
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.yellowAccent.shade700.withOpacity(1),
              spreadRadius: 5,
              blurRadius: 10,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Center(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 32, bottom: 16)),
              Text(
                'Escolha do app :',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              //como a imagem de resultado vai ser alterada a todo momento, eu preciso por ela numa variavel para poder manipular ela
              Image(image: this._imagemApp, height: 120),
              Padding(padding: EdgeInsets.only(top: 32, bottom: 16)),
              Text(
                this.mensagem,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              //Row para poder colocar 3 imagens em uma linha
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //como essas 3 imagens são fixas eu nao preciso por elas em variaveis para manipula-las
                  GestureDetector(
                    //aqui no ontap a gente passa uma função anonima !!! (ele nao aceita funcao com retorno)
                    onTap: () {
                      setState(() {
                        _opcaoSelecionada('pedra');
                      });
                    },
                    child: Image.asset(
                      AppImages.pedra,
                      height: 95,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _opcaoSelecionada('papel');
                      });
                    },
                    child: Image.asset(
                      AppImages.papel,
                      height: 95,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _opcaoSelecionada('tesoura');
                      });
                    },
                    child: Image.asset(
                      AppImages.tesoura,
                      height: 95,
                    ),
                  ),
                ],
              )
              //estrutura dessa column:
              //1 -> text
              //2 -> image
              //3 -> text resultado
              //4 -> row image
            ],
          ),
        ),
      ),
    );
  }
}

//GESTUREDETECTOR = QUANDO COLOCAMOS ESSE WIDGET TUDO QUE ELE ENVOLVE PODERA SER TOCADO E REALIZAR UMA AÇÃO, ASSIM COMO UM BOTÃO
//ou seja com o gestureDetector eu deixo qualquer coisa clicavel !!!
//veja a documentação pois onTap = 1 clique
//onDoubleTap = duplo clique na imagem
