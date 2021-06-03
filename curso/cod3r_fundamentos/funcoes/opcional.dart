import 'dart:math';

main() {
  //passando com o parametro
  int n1 = numeroAleatorio(100);
  print(n1);

  //sem parametro veja que da um erro, pois o parametro é obrigatorio
  //int n2 = numeroAleatorio();
  //print(n2);

  //com parametro opcional
  int n3 = numeroAleatorioOpcional(50);
  print(n3);

  //com parametro opcional não passando parametro
  //com isso ele vai pegar o valor padrao que eu defini como 10
  //obs como defini valores random ele vai de 0 a 10
  int n4 = numeroAleatorioOpcional();
  print(n4);

  //passando parametros com valores
  imprimirData(02, 05, 2021);

  //passando valors somente no dia e mes, o ano vai ser o padrao definido (1970)
  imprimirData(02, 05);

  //passando valores somente no dia, o mes e ano vai ser o padrao definido (05,1970)
  imprimirData(02);

  //posso nao passar nenhum valor e ele usa o valor padrao definido
  imprimirData();
}

int numeroAleatorio(int maximo) {
  return Random().nextInt(maximo);
}

//veja que quando queremos passar valores opcionais(ou seja podemos passar o parametro ou nao passamos o parametro)
//colocamos o parametro entre []
//porém se nao for colocado parametros na função ele vai atribuir o resultado como 10
//pois 10 é o valor padrao que eu defini
int numeroAleatorioOpcional([int maximo = 11]) {
  return Random().nextInt(maximo);
}

imprimirData([int dia = 1, int mes = 1, int ano = 1970]) {
  print('$dia/$mes/$ano');
}

//aqui vamos ver como deita parametro obrigatorio e parametro opcional
//veja que eu coloco os [] a partir do mes, ou seja o dia é obrigatorio
//posso fazer isso da forma como eu desejar
imprimirData2(int dia, [int mes = 1, int ano = 1970]) {
  print('$dia/$mes/$ano');
}
