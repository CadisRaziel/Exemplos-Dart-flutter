import 'dart:math';

main() {
  //Primeiro exemplo

  //posso colocar os valores diretamente na função
  NomeQualquer(2, 5);

  //posso passar variaveis com valores para função
  int c = 4;
  int d = 5;
  NomeQualquer(c, d);

  SomaDoisNumerosAleatoriamente();
}

//função com parametros de entrada, ou seja (int a, int b)
//esta função nao retorna nada
//quando nao retorna nada é interessante colocarmos void(para descrever vazio ou nao retorna nada, só para ficar de facil leitura)

//posso nao colocar void tambem, que eu sei que nao retorna nada
NomeQualquer(int a, int b) {
  print(a + b);
}

//essa função nao recebe nenhum parametro
//e não retorna nada
void SomaDoisNumerosAleatoriamente() {
  int n1 = Random().nextInt(11);
  int n2 = Random().nextInt(11);
  print('Os valores sorteados foram: $n1 e $n2');
  print(n1 + n2);
}
