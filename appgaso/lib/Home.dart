import 'package:appgaso/core/app_images.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //essa classe é para capturar o que o usuario digita no textfield
  //repare que dentro de cada textfield tem um controller aonde colocaremos essas duas variaveis abaixo
  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();

  String _txtResultado = '';

  void _calcular() {
    //pegando o que o usuario digitou (como pegamos como text ou seja 'string' precisamos converter para double para podermos fazer as contas)
    double? precoAlcool = double.tryParse(_controllerAlcool.text);
    double? precoGasolina = double.tryParse(_controllerGasolina.text);

    //parse = faz a conversão e exibe uma mensagem de erro caso nao seje possivel fazer a conversão
    //tryParse = faz a conversão e se não der certo retorna um tipo nullo (porém ele interfece no nullsafety com isso devemos por double?

    if (precoAlcool == null || precoGasolina == null) {
      setState(() {
        _txtResultado =
            "Número inválido, digite números maiores que 0 e utilizando PONTO ex: 1.00";
      });
    } else {
      //aqui ficaŕa o calculo !
      //se o usuario fizer tudo certo ele vem pro else e faz o calculo
      //se não ele fica preso no if para corrigir o que está errado
      if ((precoAlcool / precoGasolina) >= 0.7) {
        setState(() {
          _txtResultado = 'Melhor abastecer com Gasolina.';
        });
      } else {
        setState(() {
          _txtResultado = 'Melhor abastecer com Álcool.';
        });
      }
      //se eu tirar os comentarios dessa função, quando o usuario calcular ele vai limpar os campos !
      //veja que eu fiz a função fora dessa e instanciei ela aqui dentro!
     // _limparCampos();
    }
  }

  //CASO EU QUERIA LIMPAR OS CAMPOS QUANDO O USUARIO FAZER O CALCULO !

  void _limparCampos() {
    //repare que eu nao coloquei setState aqui, o motivo é que quando eu passo os controladores direto sem ter uma variavel pegando eles como valor
    //eles ja fazem o setState automatico !
    _controllerAlcool.text = '';
    _controllerGasolina.text = '';    
    _txtResultado = '';
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Álcool ou Gasolina ?'),
        centerTitle: true,
        backgroundColor: Colors.indigo.shade900,
        //toolbarHeight = define a largura da faixa do appbar
        toolbarHeight: 40,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: (){
              setState(() {
                _limparCampos();
              });
            },
         )
        ],
      ),
      body: Container(
        //SingleChildScrollview para por um scroll na tela !
        child: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 32),
                child: Image.asset(AppImages.logo),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  'Saiba qual a melhor opção para abastecimento do seu carro :D',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: 'Digite o preço do Álcool',
                    hintText: 'Ex: 3.30',
                    icon: Icon(Icons.directions_car)),
                style: TextStyle(fontSize: 22),
                controller: _controllerAlcool,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: 'Digite o preço da Gasolina',
                    hintText: 'Ex: 4.50',
                    icon: Icon(Icons.directions_car)),
                style: TextStyle(fontSize: 22),
                controller: _controllerGasolina,
              ),
              Padding(
                padding: EdgeInsets.only(top: 40),
                child: Text(
                  _txtResultado,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrangeAccent.shade700),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 40),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _calcular();
                    });
                  },
                  child: Text(
                    'Calcular',
                    style: TextStyle(fontSize: 16),
                  ),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.indigo.shade900,
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(40),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//estrutura
//Padding(image),
//Padding(text),
//TextField(),
//TextField(),
//Padding(button)
