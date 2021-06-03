main() {
  //sem retorno
  juntar(1, 9);

  //com retorno
  juntar2('Bom ', 'dia');

  //com retorno (armazenando o resultado em uma variavel)
  //como é dynamic eu posso por qualquer valor
  String resultado = juntar2('O valor de PI é ', 3.1415);
  print(resultado);
}

//parametros dinamicos(dynamic)
//se eu nao especificar o que a, b são ele automaticamente os deixa como "dynamic"
//eu posso especificar como dynamic tambem
juntar(dynamic a, b) {
  print(a + b);
}

//posso retornar uma função dynamic tambem
dynamic juntar2(a, b) {
  print(a.toString() + b.toString());
  return a.toString() + b.toString();
}
