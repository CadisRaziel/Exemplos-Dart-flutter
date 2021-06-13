import 'package:doc/efeitos/botao_downloadYT.dart';
import 'package:doc/efeitos/core/colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonDownload(primaryColor: Color.fromRGBO(57, 92, 249, 1), darkPrimaryColor: Color.fromRGBO(44, 78, 233, 1)),
              SizedBox(height: 20,),
              //quando a cor é muito clara devemos criar uma classe para coloca-la aqui
              ButtonDownload(primaryColor: AppColors.yellow, darkPrimaryColor: AppColors.gold,),
              SizedBox(height: 20,),
              ButtonDownload(primaryColor: Colors.green.shade400, darkPrimaryColor: Colors.green.shade800),
              SizedBox(height: 20,),
              ButtonDownload(primaryColor: Colors.red.shade400, darkPrimaryColor: Colors.red.shade700),
            ],
          ),
        ),
      ),      
    );
  }
}