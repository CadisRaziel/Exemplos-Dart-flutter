main() {
  //colocando uma função anonima em uma variavel var
  var adicao = (int a, int b) {
    return a + b;
  };
  print(adicao(4, 19));

  //agora fazendo uma arrow function anonima
  //LEMBRE-SE UMA ARROW FUNCTION SEMPRE RETORNA ALGO DE FORMA AUTOMATICA
  //OU SEJA NAO PRECISA COLOCAR O RETURN !!!!!
  var subtracao = (int a, int b) => a - b;
  print(subtracao(10, 5));

  var multiplicacao = (int a, int b) => a * b;
  print(multiplicacao(5, 5));

  //uma observação aqui o resultdao vai dar um double
  //então automaticamente a função arrow vai fazer o var virar double
  var divisao = (int a, int b) => a / b;
  print(divisao(10, 2));
}
