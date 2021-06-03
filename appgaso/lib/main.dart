import 'package:appgaso/Home.dart';
import 'package:flutter/material.dart';

void main() {
  //lembre-se sempre que for instanciar algum modulo criado coloque como MaterialApp e dentro dele o home e ai sim estancie a classe !
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}
