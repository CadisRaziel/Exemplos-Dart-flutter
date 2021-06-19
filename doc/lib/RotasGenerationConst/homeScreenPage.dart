
import 'package:doc/RotasGenerationConst/RotasNomeadas.dart';
import 'package:flutter/material.dart';

@immutable
class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ///Esse container vai criar uma bola redonda de fundo da lampada
              Container(
                ///250x250 ele fica com a bola perfeiramente ao centro !
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  ///cor de fundo do circulo
                  color: const Color(0xFF222222),
                ),
                ///Esse center que contem um icone dentro ele vai dentro da bola redonda criada acima e vai ser inserido um icone de lampada
                ///Com isso da o efeito de uma bola com uma lampada dentro (tipo uma imagem!)
                child: Center(
                  child: Icon(
                    Icons.lightbulb,
                    size: 175,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 32),
              Text(
                'Adicione sua lâmpada',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(routeDeviceSetupStart);
        },
        child: Icon(Icons.add),
      ),
    );
  }


  ///Repare que posso criar o AppBar separadamente !!
  ///Porém tudo que esta aqui dentro pode ser perfeitamente adicionado ao AppBar la em cima mesmo!
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text('Bem Vindo',),
      actions: [
        IconButton(
          icon: Icon(Icons.settings),
          onPressed: () {
            Navigator.pushNamed(context, routeSettings);
          },
        ),
      ],
    );
  }
}