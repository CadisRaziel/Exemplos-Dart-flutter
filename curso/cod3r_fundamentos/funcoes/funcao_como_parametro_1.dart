import 'dart:math';

//passando funções como parametros
void executar(Function fnPar, Function fnImpar) {
  //vamos fazer o seguinte, se o numero de par chama a fnPar, se der impar chama a fnImpar
  //lembre-se que as duas fnPar e fnImpar são funções
  var sorteado = Random().nextInt(10);
  print('O valor sorteado foi $sorteado');
  sorteado % 2 == 0 ? fnPar() : fnImpar();
}

main() {
  //guardando funções anonimas em uma variavel
  var minhaFnPar = () => print('Eita! O valor é par!');
  var minhaFnImpar = () => print('Legal! O valor é ímpar!');

  //passando as funções anonimas guardadas na variavel como parametro da função 'executar'
  //e ao executar o código repare que essas duas funçoes anonimas vao pegar o resultado do Random() e apresentar as mensagem!
  executar(minhaFnPar, minhaFnImpar);

  //lembre-se por ser funções podemos por valor nomiado{}, valor opcional[]...
}
