///utilizando o METODO CASCATA ou seja ..


class BigObject {
  int inteiro = 0;
  String umaString = '';
  List<double> lista = [];
  bool _terminar = false;
  
  void allDone() {
    _terminar = true;
  }
}

BigObject fillBigObject(BigObject obj) {
  //repare que eu consigo acessar as variaveis da classe BigObject utilizando ..
  return obj
    ..inteiro = 1
    ..umaString = 'String!'
    ..lista.add(3)    
    ..allDone();
}
