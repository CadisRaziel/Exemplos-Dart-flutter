import 'dart:io';

main() {
  //while cria uma quantidade indeterminada de paginas
  //for cria uma quantidade determinada de paginas

  //Olhe só que interessante, nós não temos uma quantidade determinada de repetições
  //ou seja quem vai dizer para variavel digitando se pode ou não encerrar o processo é a string 'sair'
  //então se o usuario digitar 'sair' o loop termina !
  var digitando = '';
  while (digitando != 'sair') {
    stdout.write('Digite algo ou sair: ');
    digitando = stdin.readLineSync().toString();
  }

  print('Fim');

  //DIFERENÇA ENTRE DO WHILE E WHILE
  //DO WHILE = OBRIGATORIAMENTE O BLOCO SERA EXECUTADO UMA UNICA VEZ, ou seja
  //mesmo eu tento isso var "digitando3 = 'sair'""; ele vai fazer o loop até o usuario digitar o sair
  //porque sair colocamos no while (digitando3 != 'sair'); como porta de saida (ou seja a expressão esta como falsa)

  //WHILE = eu tendo a expressão como verdadeira var digitando = '';, ela só vai ficar falsa com a expressão sair while (digitando != 'sair')
  //ou seja se ela inicializar com sair ela ja vai dar false e encerrar o processo, diferente do do while que vai dar o loop até o usuario digitar mesmo tendo Sair inicializando

  // Utiliando DO WHILE
  var digitando3 = 'sair';
  do {
    stdout.write('Digite algo ou sair: ');
    digitando3 = stdin.readLineSync().toString();
  } while (digitando3 != 'sair');

  //posso usar o for para fazer a mesma coisa, porém não faz sentido algum
  //veja que ele não tem uma entrada e não tem um incremento
  var digitando2 = '';
  for (; digitando2 != 'sair';) {
    stdout.write('Digite algo ou sair: ');
    digitando2 = stdin.readLineSync().toString();
  }
}
