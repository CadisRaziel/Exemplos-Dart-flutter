import 'package:atmconsultoria/TelaCliente.dart';
import 'package:atmconsultoria/TelaContato.dart';
import 'package:atmconsultoria/TelaEmpresa.dart';
import 'package:atmconsultoria/TelaServico.dart';
import 'package:atmconsultoria/core/app_images.dart';
import 'package:atmconsultoria/core/app_text_style.dart';
import 'package:flutter/material.dart';

class ATM extends StatefulWidget {
  @override
  _ATMState createState() => _ATMState();
}

class _ATMState extends State<ATM> {

  void _abrirEmpresa() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => TelaEmpresa()));
  }
  void _abrirServico() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => TelaServico()));
  }
  void _abrirCliente() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => TelaCliente()));
  }
  void _abrirContato() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => TelaContato()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColorr antes do appbar define a cor de fundo da tela
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('ATM consultoria', style: AppTextStyles.titleJP),
        backgroundColor: Colors.lime,
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppImages.logo),
            Padding(
              padding: EdgeInsets.only(top: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: _abrirEmpresa,
                    child: Image.asset(AppImages.menuEmpresa),
                  ),
                  GestureDetector(
                    onTap: _abrirServico,
                    child: Image.asset(AppImages.menuServico),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: _abrirCliente,
                    child: Image.asset(AppImages.menuCliente),
                  ),
                  GestureDetector(
                    onTap: _abrirContato,
                    child: Image.asset(AppImages.menuContato),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
