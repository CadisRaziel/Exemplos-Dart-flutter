main() {
  //while cria uma quantidade indeterminada de paginas
  //for cria uma quantidade determinada de paginas

  //int a = 0; //variavel
  //a < 10; //expressão
  //a++ //como ela vai ser incrementada
  for (int a = 0; a < 10; a++) {
    print('a = $a');
  }
  print("Fim do A");

//desafio ir de 100 até 0 de 4 em 4
  for (int b = 100; b >= 0; b -= 4) {
    print('b = $b');
  }
  print("Fim do B");

  //colocando uma variavel fora do escopo do bloco for
  int c = 0;
  for (; c <= 10; c++) {
    print('c = $c');
  }
  //repare que inicialmente dentro do for ao invez de colocar "int c = 0", colocamos apenas ;
  //pois criamos o int c = 0 fora do escopo do for

  //podemos colocar uma variavel fora do For e ele vai da c = 11 pois quando atigir o 11 vai dar como o for false e vai parar o loop
  print('[FORA] c = $c');

  //exercicio para apresentar as notas
  var notas = [8.9, 9.3, 7.8, 6.9, 9.1];
  for (var i = 0; i < notas.length; i++) {
    print("Nota ${i + 1} = ${notas[i]}");
  }
}
