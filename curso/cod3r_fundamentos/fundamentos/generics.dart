main() {
  //Generic é quando definimos uma List e passamos argumento ou seja
  //List <String> , List<Double>...
  List<String> frutas = ['Banana', 'maça'];
  frutas.add('melao'); //eu só posso adicionar outras STRINGS

  //Resumindo o generic é o parametro que é passado que no caso é String, ou double ou int..

  //lembre-se que map é chave e valor
  Map<String, double> salarios = {
    //aqui eu estou dizendo que a chave é string por isso passo ela primeiro e o valor é double
    'Gerente': 20000.00,
    'Vendedor': 10000.00,
    'Estágiario': 600.00
  };
}
