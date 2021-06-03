import 'package:flutter/material.dart';
import 'package:frases/Navegacao_Entre_Telas/SegundaTela.dart';

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
                  //Navigator é a classe usara para navegação entre telas
                  //push = abre uma tela que voce defina
                  //pop = fecha a tela atual e abre uma nova
                  //context = qual tela voce ta no mommento
                  //OBERSVAÇÃO IMPORTANTE NA SEGUNDA TELA VAI SER ATRIBUITO AUTOMATICAMENTE UM BOTAO NO APPBAR PARA VOLTAR
                  //ISSO EU UM COMPONENTE QUE VEM JUNTO DA CLASS NAVIGATOR !!
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TelaSecundaria()));
                },
                child: Text('ir para Segunda tela'),
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
