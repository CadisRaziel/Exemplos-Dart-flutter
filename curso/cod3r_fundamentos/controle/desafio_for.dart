//realizando um desafio do curso
//não podemos usar numeros
//precisarmos imprimir os # na sequencia:
//#
//##
//###
//####
//#####
//######

main() {
  //usando numeros
  var valor = '#';
  for (int i = 0; i < 6; i++) {
    print(valor);
    valor += '#';
  }
  print('Fim do for usando numeros');

  //usando strings !
  for (var valor1 = '#'; valor1 != '#######'; valor1 += '#') {
    print(valor1);
  }
  print('Fim do for usando strings');
}
