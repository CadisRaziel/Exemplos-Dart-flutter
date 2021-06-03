class Conta {
  String valor = '';
}

main() {
  //ao definir final eu nao consigo mais instanciar essa classe novamente, repare no erro abaixo
  final Conta divida = Conta();
  divida.valor = "Internet";
  print(divida.valor);

  //repare nesse codigo eu estou conseguindo instanciar a classe novamente na variavel divida
  //e fazendo isso ele nai vai ter mais os atributos que colocamos acima
  divida = Conta();
}
