import 'dart:convert';

import 'package:apibitcoin/core/app_image.dart';
import 'package:flutter/material.dart';

//importes usados
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _brl = '0';
  String _usd = '0';

  void _precoFunc() async {
    var url = Uri.parse('https://blockchain.info/ticker');
    http.Response response = await http.get(url);

    Map<String, dynamic> objetoRetorno = jsonDecode(response.body);
    
    setState(() {
      _brl = objetoRetorno['BRL']['buy'].toString();
      _usd = objetoRetorno['USD']['buy'].toString();
      
    });

    // print('Resultado ${objetoRetorno['BRL']}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppImages.bit),
            Padding(
              padding: EdgeInsets.only(top: 30, bottom: 30),
              child: Text(
                'R\$: $_brl \n U\$: $_usd',                
                style: TextStyle(fontSize: 35),
              ),
            ),
            ElevatedButton.icon(
              label: Text('Atualizar'),
              icon: Icon(Icons.monetization_on_outlined),
              onPressed: () {
                setState(() {
                  _precoFunc();
                });
              },
              style: ElevatedButton.styleFrom(primary: Colors.amber.shade800),
            ),
          ],
        ),
      ),
    );
  }
}
