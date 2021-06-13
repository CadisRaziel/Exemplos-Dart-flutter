import 'package:flutter/material.dart';

import 'page2.dart';

class AnimationPage extends StatefulWidget {
  const AnimationPage({ Key? key }) : super(key: key);

  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {


  Route _createRoute(){

    //doc das 'Curve' = https://api.flutter.dev/flutter/animation/Curves-class.html
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => Page2(),
      transitionsBuilder: (context, animation, secondaryAnimation, child){
        //0.5 ele começa do lado direito e vai subindo até o 1
        var comeco = Offset(0.5, 1);
        var fim = Offset.zero;
        var curva = Curves.ease; //ir testando todos os Curves.
        var interpolacao = Tween(begin: comeco, end: fim).chain(CurveTween(curve: curva));
  
        return SlideTransition(
          position: animation.drive(interpolacao),   //repare que animation esta como parametro
          child: child,
        );
      }
    );
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        //posso por no appbar um iconbutton tambem
        child: ElevatedButton(onPressed: (){
          Navigator.of(context).push(_createRoute());
        }, child: Text('Proxima Pagina')),
      ),
    );
  }
}

//         /\
//A animação (fornecida para o retorno de chamada transitionsBuilder) produz valores de 0 a 1.
//O CurveTween mapeia esses valores para novos valores entre 0 e 1 com base em sua curva.
//O Tween<Offset>mapeia os doublevalores para Offsetvalores.







// outra maneira de usar um nimation<Offset>
/*
transitionsBuilder: (context, animation, secondaryAnimation, child) {
  var begin = Offset(0.0, 1.0);
  var end = Offset.zero;
  var curve = Curves.ease;

  var tween = Tween(begin: begin, end: end);
  var curvedAnimation = CurvedAnimation(
    parent: animation,
    curve: curve,
  );

  return SlideTransition(
    position: tween.animate(curvedAnimation),
    child: child,
  );
}
*/