import 'package:flutter/material.dart';

class TelaSecundaria extends StatefulWidget {
  @override
  _TelaSecundariaState createState() => _TelaSecundariaState();
}

class _TelaSecundariaState extends State<TelaSecundaria> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tela Secundaria'),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  //Para usar rota nomeada eu uso o Navigator.pushNamed
                  //repare que para ir na tela inicial é só colocar /
                  //pois a tela TelaPrincipal esta instanciada no Main.dart
                  Navigator.pushNamed(context, '/');
                },
                child: Text('ir para a primeira tela'),
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(15),
                    //primary = cor de background do botao 
                    primary: Colors.lime,
                    //onPrimary = cor do texto do botao
                    onPrimary: Colors.red)),
          ],
        ),
      ),
    );
  }
}
