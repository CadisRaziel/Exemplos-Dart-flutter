import 'package:flutter/material.dart';

import '../core/app_text_styles.dart';

class RadionButton extends StatefulWidget {
  @override
  _RadionButtonState createState() => _RadionButtonState();
}

class _RadionButtonState extends State<RadionButton> {

  bool _switchB = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //appTextStyle é a classe criada dentro de 'core' aonde esta nossa fonte
        title: Text('Switch Button', style: AppTextStyles.titleJP),
        backgroundColor: Colors.brown.shade600,
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
              color: Colors.brown.shade800.withOpacity(1),
              //spreadRadius = aumenta o shadow
              spreadRadius: 15,

              //blurRadius = deixa mais claro o shadow
              blurRadius: 10,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Switch(
              //aqui no value é igual checkbox true or false !
              value: _switchB,
               onChanged: (bool valor){
                 setState(() {
                  _switchB = valor;               
                 });
               }
               ),
               Text('Receber Notificações?'),
          ],
        ),
      ),
    );
  }
}
