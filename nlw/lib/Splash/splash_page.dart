import 'package:flutter/material.dart';
import 'package:nlw/core/core.dart';
import 'package:nlw/home/home_page.dart';
//para dar esse import do material rapidamente clique no Widget e de CTRL + . e vai aparecer o import dele !!

//a splash não é uma pagina que vai mudar !!!

//se eu digitar stl e der tab ele ja cria a class abaixo basta só colocar o nome dela "SplashPage"
//splashscreen concluida !!
class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //função de delay criada para aparecer a tela de splash e der 2 segundos ir para tela de homepage
    Future.delayed(Duration(seconds: 2)).then((_) => Navigator.pushReplacement(
        //pushReplacement = para impedir que o app volte para a tela de splash !! (a splash deve aparecer apenas 1 vez, que é na hora que abre o app)
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        )));
    return Scaffold(
      //colocando o background gradiente !!!
      body: Container(
        decoration: BoxDecoration(gradient: AppGradients.linear),
        //colocando a imagem e posicionando ela
        child: Center(
          child: Image.asset(AppImages.logo),
        ),
      ),
    );
  }
}
