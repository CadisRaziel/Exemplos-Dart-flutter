import 'package:caraoucoroa/core/app_images.dart';
import 'package:flutter/material.dart';

class Resultado extends StatefulWidget {

  //Observação importante, nós poderiamos clicar na moeda nessa tela e ela randomicamente gerar cara ou coroa
  //porém estamos aprendendo a como passar parametros da tela inicial para uma outra tela
  //com isso nos criamos esse construtor, para que na tela Home seja feita a configuração do cara ou coroa randomico !

  String? resultado;

  Resultado(this.resultado);

  @override
  _ResultadoState createState() => _ResultadoState();
}

class _ResultadoState extends State<Resultado> {

  //Navigator.pop vai fechar essa tela !
  void _voltarTelaInicial(){
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {

   var caminhoImagem;

   if(widget.resultado == "cara"){
     caminhoImagem = AppImages.moedaCara;
   }else {
     caminhoImagem = AppImages.moedaCoroa;
   }

    return Scaffold(
      //para colocar cores hexadecimais coloque dessa forma Color(0xff)!
        backgroundColor: Color(0xffb3ffb3),
        body: Container(
          margin: EdgeInsets.only(left: 120, top: 200, right: 110, bottom: 210),
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(1600),
                topRight: Radius.circular(1600),
                bottomLeft: Radius.circular(1600),
                bottomRight: Radius.circular(1600)),
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
              Image.asset(caminhoImagem ,width: 250, height: 200),                
              Padding(padding: EdgeInsets.only(bottom: 50)),      
              GestureDetector(
                onTap: _voltarTelaInicial,
                child: Image.asset(AppImages.botaoVoltar, width: 140,),
              )
            ],
          ),
        ),
        );
  }
}