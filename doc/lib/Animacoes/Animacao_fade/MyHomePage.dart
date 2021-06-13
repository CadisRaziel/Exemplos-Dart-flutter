import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  //criando a variavel aqui, eu preciso passa-la la no main.dart como parametro !
  final String title;
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      /// Chame setState. Isso diz ao Flutter para reconstruir a IU com as alterações.
      onTap: () {
        setState(() {
          ///colocando o ! ele transforma o true para o inverso ou seja falso.
          _visible = !_visible;
        });
      },
      child: Center(
        child: AnimatedOpacity(
          // Se o widget estiver visível, anime para 0,0 (invisível).
          // Se o widget estiver oculto, anime para 1.0 (totalmente visível).
          opacity: _visible ? 1.0 : 0.0,
          duration: Duration(milliseconds: 500),
          child: Container(
            width: 200,
            height: 200,
            color: Colors.green,
          ),
        ),
      ),
    );
  }
}

/*
O AnimatedOpacitywidget requer três argumentos:

opacity: Um valor de 0,0 (invisível) a 1,0 (totalmente visível).
duration: Quanto tempo a animação deve levar para ser concluída.
child: O widget a ser animado. Neste caso, a caixa verde.

*/
