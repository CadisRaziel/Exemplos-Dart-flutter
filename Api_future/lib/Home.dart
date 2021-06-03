//Future uma maneira melhorada(moderna) de fazer consumoWeb (api)
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //precisamos criar a function com o retorno de Future<Map>
  Future<Map<String, dynamic>> _recuperarPreco() async {
    var url = Uri.parse('https://blockchain.info/ticker');
    http.Response response = await http.get(url);

    //future fica mais facil de gerenciar o consumo web
    return jsonDecode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    //repare que nao estamos usando nem Scaffold nem Container
    return FutureBuilder<Map<String, dynamic>>(
      future: _recuperarPreco(),
      //snapshot = sao os dados que recuperamos ao fazer a requisição
      builder: (context, snapshot) {
        //coneectionnState = para saber se deu certo ou não
        String resultado = '';
        switch (snapshot.connectionState) {
          case ConnectionState.none:

          case ConnectionState.waiting:
            return Center(child: Text('$resultado: Carregando (waiting)'));
          case ConnectionState.active:

          case ConnectionState.done:
            if (snapshot.hasError)
              return Text('Error: ${snapshot.error}');
            else
              return Scaffold(
                backgroundColor: Colors.white,
                body: Container(
                  margin:
                      EdgeInsets.only(left: 30, top: 50, right: 30, bottom: 50),
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
                        color: Colors.yellowAccent.shade700.withOpacity(1),
                        spreadRadius: 5,
                        blurRadius: 10,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Resultado de 15 em 15 minutos: R\$ ${snapshot.data!['BRL']['15m']}', style: TextStyle(fontSize: 24), textAlign: TextAlign.center,),
                      Text('Simbolo: R\$ ${snapshot.data!['BRL']['symbol']}', style: TextStyle(fontSize: 24),textAlign: TextAlign.justify,),
                      Text('Valor no momento: R\$ ${snapshot.data!['BRL']['buy']}', style: TextStyle(fontSize: 24),textAlign: TextAlign.center,),
                      SizedBox(height: 50,),
                      Text('Resultado de 15 em 15 minutos: U\$ ${snapshot.data!['USD']['15m']}', style: TextStyle(fontSize: 24),textAlign: TextAlign.center ),
                      Text('Symbol: U\$ ${snapshot.data!['USD']['symbol']}', style: TextStyle(fontSize: 24),textAlign: TextAlign.justify,),
                      Text('Valor no momento: U\$ ${snapshot.data!['USD']['buy']}', style: TextStyle(fontSize: 24),textAlign: TextAlign.center,),
                    ],
                  ),
                
                ),
              );
        }
      },
    );
  }
}

//ConnectionState.none = status de conexão é nullo
//ConnectionState.waiting = aguardando os dados serem recuperados (imagine que demora 5 segundos, ele se mantem no estado waiting.)
//ConnectionState.active = utilizado mais para stream (conexao mantem ativa)
//ConnectionState.done = terminou de fazer o processo de recuperação dos dados
