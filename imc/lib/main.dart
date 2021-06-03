import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //criamos 2 controlles aqui sem precisar criar em outro modulo
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _infoText = "Informe seus dados";

  //icone refresh, ao aperta-lo ele vai limpar os campos !!
  void _resetField() {
    //nao demos setState aqui pois ja passamos para nosso layout que esses são os nossos controller
    //então quando eu modificar algo usando os controller o layout vai dizer "nossa tenho que me redesenhar"
    //então ele vai desenhar novamente automaticamente o textfield quando modificar o texto

    weightController.text = "";
    heightController.text = "";

    setState(() {
      //da para colocar o set state dentro de uma função em apenas uma variavel !!!
      _infoText = "Informe seus dados";
      _formKey = GlobalKey<FormState>();
    });
  }

  //função para calcualr o imc
  void _calculate() {
    setState(() {
      //double.parse pois temos que converster o text para double
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text) /
          100; //(estamos dividindo por 100 pois colocamos em CM a informação)

      //calculo
      double imc = weight / (height * height);
      print(
          imc); //codigo apenas para debug (vai mostrar o resultado no debug do terminal)
      if (imc < 18.6) {
        _infoText =
            "Abaixo do peso (${imc.toStringAsPrecision(3)})"; //toStringAsPrecision(4) = vai aparecer 2 digitos apos a virgula, ou seja (8.11)
      } else if (imc >= 18.6 && imc < 24.9) {
        _infoText = "Peso ideal (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 24.9 && imc < 29.9) {
        _infoText = "Levemente acima do peso (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 29.9 && imc < 34.9) {
        _infoText = "Obesidade Grau I (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 34.9 && imc < 39.9) {
        _infoText = "Obesidade Grau II (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 40) {
        _infoText = "Obesidade Grau III (${imc.toStringAsPrecision(3)})";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //Scaffold é responsavel por colcoar appbar, bottonnavigation, tabbar, drawer etc...
    return Scaffold(
        appBar: AppBar(
          title: Text("Calculador de IMC"),
          centerTitle: true,
          backgroundColor: Colors.green,
          actions: [
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed:
                  _resetField, //Veja como passamos nossa função de resfresh aqui !!
            )
          ],
        ),
        backgroundColor: Colors.white,
        //SingleChildScrollView = colocamos isso pois imagine o seguinte quando abrir o teclado ele sobrepoe alguma informação(isso vai dar um erro)
        //então usamos esse metodo para que tenha uma barra de rolagem e não aconteça o erro !!!
        body: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Form(
              //para usarmos a GlobalKey precisamos colocar o Form primeiro de tudo !!!
              key:
                  _formKey, //e aqui passamos a _formKey que recebeu o GlobalKey
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Icon(Icons.person_outline, size: 120, color: Colors.green),
                  TextFormField(
                      //para usarmos o Form precisamos alterar aqui de TextFiel para TextFormField
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "Peso (kg)",
                        labelStyle: TextStyle(color: Colors.green),
                      ),
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.green, fontSize: 25),
                      controller:
                          weightController, //Repare como eu coloquei o controller aqui
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Insira o seu peso.";
                        } else {
                          return null;
                        }
                      }),
                  SizedBox(
                    height: 24,
                  ),
                  TextFormField(
                      //para usarmos o Form precisamos alterar aqui de TextFiel para TextFormField
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "Altura (cm)",
                        labelStyle: TextStyle(color: Colors.green),
                      ),
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.green, fontSize: 25),
                      controller:
                          heightController, //Repare como eu coloquei o controller aqui
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Insira sua altura.";
                        } else {
                          return null;
                        }
                      }),
                  SizedBox(
                    height: 24,
                  ),
                  ElevatedButton(
                      child: Text("Calcular"),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                          onPrimary: Colors.white,
                          textStyle:
                              TextStyle(color: Colors.white, fontSize: 25)),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _calculate();
                        }
                      }),
                  Text(
                    _infoText,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.green, fontSize: 25),
                  )
                ],
              ),
            )));
  }
}
