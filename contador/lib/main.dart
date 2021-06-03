import 'package:contador/core/app_images.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(title: "Contador de pessoas", home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _people =
      0; //repare nos botões e na função _changePeople como eu utilizo essa variavel
  String _infoText = "Pode Entrar";

  void _changePeople(int delta) {
    setState(() {
      //eu sempre preciso por o setSate para que o flutter identifique a mudança e altere a tela !!
      _people += delta;

      //utilizando a variavel _infoText
      if (_people < 0) {
        _infoText = "Mundo Invertido";
      } else if (_people <= 10) {
        _infoText = "Pode Entrar";
      } else {
        _infoText = "Lotado";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          AppImages.restaurante,
          fit: BoxFit.fitHeight,
          height: 1000,
        ),
        Column(
          //para centrarlizar ao meio, o mainAxis é usado na vertical
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Pessoas: $_people",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextButton(
                      onPressed: () {
                        _changePeople(
                            1); //lembre-se não podemos colocar "+" dentro dos () aqui (pois ele ja esta positivo)
                      },
                      child: Text(
                        "+1",
                        style: TextStyle(fontSize: 40, color: Colors.white),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextButton(
                      onPressed: () {
                        _changePeople(-1);
                      },
                      child: Text(
                        "-1",
                        style: TextStyle(fontSize: 40, color: Colors.white),
                      )),
                ),
              ],
            ),
            Text(
              _infoText,
              style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontSize: 30),
            ),
          ],
        ),
      ],
    );
  }
}
