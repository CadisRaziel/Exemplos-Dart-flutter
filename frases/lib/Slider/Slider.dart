import 'package:flutter/material.dart';

import '../core/app_text_styles.dart';

class RadionButton extends StatefulWidget {
  @override
  _RadionButtonState createState() => _RadionButtonState();
}

class _RadionButtonState extends State<RadionButton> {

  double _valor = 0;
  String _labelDinamic = '0';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //appTextStyle é a classe criada dentro de 'core' aonde esta nossa fonte
        title: Text('Slider Button', style: AppTextStyles.titleJP),
        backgroundColor: Colors.purple,
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
              color: Colors.purple.withOpacity(1),
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
          children: [
              Slider(                
                value: _valor,
                //posso colocar valor double se precisar !
                min: 0,
                max: 10,
                //label e division devem ser usados juntos !
                //label e divison vai fazer com que crie pontinhos no slider para poder selecionar numero inteiro
                //se eu nao coloco os 2 ele vai aceitar numeros quebrados(double)
                label: _labelDinamic,
                divisions: 10,
                //activeColor = cor da bolinha e linha do slider ao ser movimentado
                activeColor: Colors.red,                
                //inactiveColor = para mudar a cor da linha inativa
                inactiveColor: Colors.purple,
                 onChanged: (double novoValor){
                   setState(() {
                     _valor = novoValor;
                     _labelDinamic = '$novoValor';
                   });     
                  //  print('$novoValor');               
                 }
                 ),
                 ElevatedButton(
                   onPressed: (){
                     print('Valor selecionado: $_valor');
                   },
                    child: Text('Salvar')
                    ),
          ],
        ),
      ),
    );
  }
}
