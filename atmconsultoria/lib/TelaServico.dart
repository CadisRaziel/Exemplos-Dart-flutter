import 'package:atmconsultoria/core/app_images.dart';
import 'package:flutter/material.dart';

class TelaServico extends StatefulWidget {
  @override
  _TelaServicoState createState() => _TelaServicoState();
}

class _TelaServicoState extends State<TelaServico> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Serviços'),
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
                  Image.asset(AppImages.detalheServico),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      'Nossos serviços',
                      style: TextStyle(
                          fontSize: 20, color: Colors.lightBlueAccent),
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text('Consultoria'),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text('Calculo de preços'),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text('Acompanhamento de projetos'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
