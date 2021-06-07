import 'package:flutter/material.dart';

Color getCategoryColor(String categoria){
  switch(categoria) {
    case 'Entreterimento':
      return Colors.red[400]!;
    case 'Comida':
      return Colors.green[400]!;
    case 'Internet':
      return Colors.blue[400]!;
    case 'Combustivel':
      return Colors.purple[400]!;
    default: 
      return Colors.orange[400]!;
  }
}