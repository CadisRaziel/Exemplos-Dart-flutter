import 'package:flutter/material.dart';

import '../core/app_text_styles.dart';

class RadioButton extends StatefulWidget {
  @override
  _RadioButtonState createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {
  String? _escolhaUsuario;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //appTextStyle é a classe criada dentro de 'core' aonde esta nossa fonte
        title: Text('Radion Button', style: AppTextStyles.titleJP),
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.only(left: 30, top: 50, right: 30, bottom: 50),
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
              color: Colors.deepOrange.withOpacity(1),
              //spreadRadius = aumenta o shadow
              spreadRadius: 15,

              //blurRadius = deixa mais claro o shadow
              blurRadius: 10,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //podemos usar esse RadioList pois tem mais configurações
            RadioListTile(
                title: Text('Masculino'),
                value: 'M',
                groupValue: _escolhaUsuario,
                onChanged: (String? escolha) {
                  setState(() {
                    _escolhaUsuario = escolha;
                  });
                }),
            RadioListTile(
                title: Text('Feminino'),
                value: 'F',
                groupValue: _escolhaUsuario,
                onChanged: (String? escolha) {
                  setState(() {
                    _escolhaUsuario = escolha;
                  });
                }),
                ElevatedButton(
                  onPressed: (){
                    print('Resultado: $_escolhaUsuario');
                  },
                   child: Text('Salvar')
                   ),
          ],
        ),
      ),
    );
  }
}
