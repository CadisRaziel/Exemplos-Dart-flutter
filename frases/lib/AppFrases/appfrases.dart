import 'package:flutter/material.dart';
import 'package:frases/core/app_images.dart';
import 'dart:math';

main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> _frases = [
    'O melhor guerreiro não é aquele que ganha sempre, mas o que mantém o orgulho mesmo na derrota. (Anime Dragon Ball Z)',
    'As pessoas só irão entender umas as outras quando sentirem a mesma dor. (Anime Naruto)',
    'o destino está além da compreensão humana. (Anime Berseker)',
    'Quando se pode ver o futuro não se deve olhar para o passado. (Anime Bleach)',
    'Há momentos que você precisa desistir de alguma coisa para preservar outra. (Anime Tokyo Ghoul)',
    'Uma pessoa realmente morre ao cair na desistência, quando se recusa a desistir o humano deixa de ser humano e se torna um explorador do desconhecido, se torna IMORTAL. (Anime Hellsing)'
  ];

  String _fraseGerada = 'Clique abaixo para gerar uma frase!';
  
  void _gerarFrase(){
    var numeroSorteado = Random().nextInt(_frases.length);
    
    setState(() {
    _fraseGerada = _frases[ numeroSorteado ];      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Frases de animes'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Container(
        //usamos double.infinity pois não sabemos a largura exata de cada celular, por isso o infinity vai se ajustar a cada tela
        //estou usando pois o background que é a imagem nao ficou totalmente preenchida pois o container se adpta conforme a imagem
        //ou seja a imagem era pequena então ele ficou pequena, e com isso com era largura, usamos o width para resolver o problema
        //resumindo double.infinity = ocupa 100% do espaço disponivel
        height: double.infinity,
        width: double.infinity,
        //fazendo esse decoration eu consigo colocar uma imagem de fundo e logo abaixo na Column eu posso colocar widgets que ficaram por cima !
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.goku),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //SizedBox = para dar espaçamento entre os Widgets sem ter que usar padding
            SizedBox(height: 100),
            Text(_fraseGerada,            
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                    color: Colors.black)),
            SizedBox(height: 30),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    _gerarFrase();
                  });
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.pinkAccent,
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    side: BorderSide(color: Colors.pink)),
                child: Text(
                  'Nova Frase',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ))
          ],
        ),
      ),
    );
  }
}
