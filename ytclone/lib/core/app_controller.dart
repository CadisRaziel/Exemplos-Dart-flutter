import 'package:flutter/foundation.dart';

class AppController extends ChangeNotifier {

  //para fazer instancia unica, ou seja quando eu chamar o AppController em outro arquivo
  //eu vou fazer somente isso AppController.instance
  static AppController instance = AppController();

  bool darkLight = false;
  changeTheme(){
    darkLight = !darkLight;
    //colocamos !darkLight para ele virar true e vice versa 
    notifyListeners();
  }
}

