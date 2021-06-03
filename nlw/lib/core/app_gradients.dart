import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

//Aqui colocamos as cores gradientes em string !!!
//perceba o # sendo substituido pelo 0xFF
//perceba tambem que esse gradiente e colocado aqui como coloa na web

class AppGradients {
  static final linear = LinearGradient(colors: [
    Color(0xFF57B6E5),
    Color.fromRGBO(130, 87, 229, 0.695),
  ], stops: [
    0.0,
    0.695
    //para fazersmos rotação em graus tem que ser feito assim !! pega o grau e multiplica por PI
    //para converter para radiano (pi é 180 graus)
  ], transform: GradientRotation(2.13959913 * pi));
}
