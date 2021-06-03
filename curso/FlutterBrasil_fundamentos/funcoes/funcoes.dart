main() {
  //imagine que esses 2 print se repita varias vezes
  //parar evitar ficar escrevendo ele ou alterar as frases dentro dele
  //nos criamos as funções
  // print("Seja bem vindo");
  // print("Escolha sua opção");

  //olha como é facil com a função
  //e o melhor posso usar em qualquer lugar do codigo
  printIntro();

  //colocando os parametros
  calcSoma(5, 5);

//para pegar o resultado da função calcMult e jogar na variavel mult
  int resMult = calcMult(10, 2);
  print(resMult);
  //com isso podemos pegar o resMult agora e fazer o que quiser com ele
  resMult.floor();

  print(calcAreaCirculo2(5));
}

void printIntro() {
  print("Seja bem vindo");
  print("Escolha sua opção");
}

//usando parametros obrigatorios (int a, int b)
void calcSoma(int a, int b) {
  int res = a + b;
  print(res);
}

//para podermos armazenar o resultado dessa função em uma variavel e printa-la no main(){}
//devemos utulizar o return, ou seja especificar o que ela vai retornar, como int, string, double, bool etc...
//e colocar um return no final
int calcMult(int a, int b) {
  int res = a * b;
  return res;
}

//simplificando uma função
//podiamos fazer assim
double calcAreaCirculo(double raio) {
  return 3.14 * raio * raio;
}

//porém simplificando ela, ela vai ficar assim
//lembre-se funciont arrow => tem o return automatico !
double calcAreaCirculo2(double raio) => 3.14 * raio * raio;
