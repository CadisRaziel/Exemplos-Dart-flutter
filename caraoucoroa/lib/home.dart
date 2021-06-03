import 'dart:math';

import 'package:caraoucoroa/core/app_images.dart';
import 'package:caraoucoroa/resultado.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {  


  //rota para ir pra tela Resultado
  void _exibirResultado(){  
  var itens = ["cara", "coroa"];
  var numero = Random().nextInt(itens.length);
  var resultados = itens[numero];
    Navigator.push(context, MaterialPageRoute(builder: (context) => Resultado(resultados)));
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      //para colocar cores hexadecimais coloque dessa forma Color(0xff)!
        backgroundColor: Color(0xffb3ffb3),
        body: Container(
          margin: EdgeInsets.only(left: 38, top: 250, right: 38, bottom: 255),
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
                color: Colors.green.withOpacity(1),
                spreadRadius: 12,
                blurRadius: 10,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            children: [
              Image.asset(AppImages.logo),
              GestureDetector(
                onTap: _exibirResultado,
                child: Image.asset(AppImages.botaoJogar, width: 500, height: 120,),
              )
            ],
          ),
        ),
        );
  }
}
