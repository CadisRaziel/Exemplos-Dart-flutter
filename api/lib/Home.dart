import 'package:flutter/material.dart';
import 'package:http/http.dart'
    as http; //eu utilizo o 'as' para nomear esse import
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //classe para fazer o controller
  TextEditingController _cepController = TextEditingController();

  String _resultado = 'Clique aqui!';

  //lembre-se que se eu nao colocar nada antes do nome da função ela é void automaticamente !
  _recuperarCep() async {
    //comunicação Sincrona = Quando estamos conversando com uma pessoa é uma conversa sincrona voce fala e a pessoa responde(instantanea)
    //Comunicação Assincrona = Quando enviamos uma mensagem no whatsapp e a pessoa precisa de um tempo pra processar a mensagem e só depois ela responde(requer um tempo de resposta, desconhecido)

    //capturando o que o usuario digita
    String cepDigitado = _cepController.text;
    //repare que eu uso essa string ali dentro da url aonde ficava o cep numerico !!
    var url = Uri.parse('https://viacep.com.br/ws/$cepDigitado/json/');
    http.Response response;

    response = await http.get(url);

    //convertendo para json (lembre-se o valor é sempre dynamic pois não sabemos o que pode vir !!!)
    Map<String, dynamic> objetoRetorno = jsonDecode(response.body);
    String logradouro = objetoRetorno['logradouro'];
    String bairro = objetoRetorno['bairro'];
    String localidade = objetoRetorno['localidade'];
    String uf = objetoRetorno['uf'];
    String ddd = objetoRetorno['ddd'];

    setState(() {
      _resultado =
          '- Logradouro: $logradouro  \n- Bairro: $bairro \n- Localidade: $localidade \n- UF: $uf \n- DDD: $ddd';
    });

    //esse print aparece no debug console
    // print(
    //   '- Logradouro: $logradouro  \n- Bairro: $bairro \n- Localidade: $localidade \n- UF: $uf \n- DDD: $ddd'
    // );

    //apresentando os dados da api(podemos colocar o site url na extensão thunder client para verificar!)
    // print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Consumo WebService'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.number,
              maxLength: 8,
              decoration: InputDecoration(
                  labelText: 'Digite o CEP', hintText: 'Exemplo 15000-100'),
              style: TextStyle(fontSize: 20),
              //lembre-se controller é para capturar o que o usuario digitou
              controller: _cepController,
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    _recuperarCep();
                  });
                },
                child: Text('Clique aqui')),
            Text(_resultado),
          ],
        ),
      ),
    );
  }
}
