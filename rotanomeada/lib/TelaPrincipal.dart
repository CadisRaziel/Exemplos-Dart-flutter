import 'package:flutter/material.dart';


class TelaPrincipal extends StatefulWidget {
  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tela princial'),
        backgroundColor: Colors.brown,
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  //Para usar rota nomeada eu uso o Navigator.pushNamed
                  //é muito mais pratico !
                  Navigator.pushNamed(context, '/secundaria');
                },
                child: Text('ir para Segunda tela'),
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(15),
                    //primary = cor de background do botao 
                    primary: Colors.black,
                    //onPrimary = cor do texto do botao
                    onPrimary: Colors.white)),
          ],
        ),
      ),
    );
  }
}


//Navigator.PushNamed = vai para a outra tela que queremos porém ele deixa um icone de <- (caso clicarmos voltamos a tela anterios)
//Navigator.PushReplacementNamed = vai para outra tela quereremos porém ela NAO coloca o icone de <- de voltar 