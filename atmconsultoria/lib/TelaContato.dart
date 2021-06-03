import 'package:atmconsultoria/core/app_images.dart';
import 'package:flutter/material.dart';

class TelaContato extends StatefulWidget {
  @override
  _TelaContatoState createState() => _TelaContatoState();
}

class _TelaContatoState extends State<TelaContato> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Contato'),
        centerTitle: true,
        backgroundColor: Colors.lime,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(AppImages.detalheContato),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      'Contato',
                      style: TextStyle(
                          fontSize: 20, color: Colors.greenAccent.shade700),
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text('atendimento@consultoria.com.br'),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text('Telefone (017)3215-3131'),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text('Celular (017)97700-7070'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
