import 'package:flutter/material.dart';

//Stateless -> Widgets que não podem ser alterados (const)
//Stateful -> Widgets que podem ser alterados (variaveis)

//exemplo um botão que va te levar para outra tela e que ele não vai mudar de cor ou nome é um stateles
//exemplo um botão que vai alterar um texto é um stateful

void main() {
  runApp(MaterialApp(
    //debugShowCheckedModeBanner = tira a faixa de debug da tela !!
    debugShowCheckedModeBanner: false,
    //aqui no Home() eu estou instanciando a classe stateles ali em baixo \/
    //ou seja tudo que eu colocar no stateles vai ser apresentado nessa Home()
    home: HomeStateful(),
  ));
}
//para criar a classe automatica apenas coloque 'st' que vai aparecer stateles ou stateful

class HomeStateful extends StatefulWidget {
  @override
  _HomeStatefulState createState() => _HomeStatefulState();
}

class _HomeStatefulState extends State<HomeStateful> {
  //repare que essa classe é identica a classe stateles, o que muda é o extends

    //colocando a variavel antes do @override ela se torna um atributo da classe _HomeStatefulState
    //ou seja para que o setState funcione as variaveis que receberam o estado devem ficar aqui !
    //preste atenção aqui na classe statefull as variaveis aqui acima são o 1 state( ou seja o primeiro estado )
    //a partir do momento que eu crio um botão e ponho um setState nele e clico nele
    //ele vai pegar o 2 estado que sera o que eu defini ao clicar nele !!
    String texto = 'Vitor Brussolo Zerbato';
    
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Instagram'),
        backgroundColor: Colors.purple,
      ),
      body: Container(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  //para fazer a alteração ao clicar no botão eu preciso colocar o setState
                  //com isso eu defino que o estado será alterado e o flutter vai entender e alterar ele !
                  setState(() {
                  texto = 'Curso Flutter';                    
                  });
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.pink,
                  onPrimary: Colors.black,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                  side: BorderSide(color: Colors.black)
                ),
                child: Text('Clique aqui',
                style: TextStyle(fontSize: 11),)),
            //olhe que interessante como eu pego essa variavel e ela apresenta seu conteudo
            Text('Nome: $texto')
          ],
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  //build = construção do app
  Widget build(BuildContext context) {
    //aqui posso definir variaveis
    String titulo = 'Instagram';
    String conteudo = 'Conteudo principal';

    return Scaffold(
      appBar: AppBar(
        title: Text(titulo),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Text(conteudo),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.pink,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Row(
            children: [
              Text('Texto 1'),
              Text('Texto 2'),
              Text('Texto 3'),
            ],
          ),
        ),
      ),
    );
  }
}
