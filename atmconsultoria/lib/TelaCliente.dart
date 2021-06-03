import 'package:atmconsultoria/core/app_images.dart';
import 'package:flutter/material.dart';

class TelaCliente extends StatefulWidget {
  @override
  _TelaClienteState createState() => _TelaClienteState();
}

class _TelaClienteState extends State<TelaCliente> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Clientes'),
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
                  Image.asset(AppImages.detalheCliente),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      'Clientes',
                      style: TextStyle(fontSize: 20, color: Colors.lime),
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Image.asset(AppImages.cliente1),
              ),
              Text('Empresa de software'),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Image.asset(AppImages.cliente2),
              ),
              Text('Empresa de auditoria')
            ],
          ),
        ),
      ),
    );
  }
}
