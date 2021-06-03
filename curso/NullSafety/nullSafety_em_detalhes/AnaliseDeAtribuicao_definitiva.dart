//Analise de atribuição definitiva

//Sabemos que variaveis locais non-nullable devem ser inicialiazadas antes de usadas

//exemplo antes do nullsafety iria dar erro pois eu nao declarei o valor inicial de final

//agora com nullsafety como o valor de final e depois que ela é declarada com certeza ela terá seu valor como na função!
//ou seja com o nullsafety o final int resultado é inicializado no if() pois a variavel foi atribuida com o valor da expresão
//o final garante que ao momento que ele tiver o seu valor, eu nao vou poder mais trocar esse valor !!
int seqFibonacci(int n) {
  final int resultado;
  if (n < 2) {
    resultado = n;
  } else {
    resultado = seqFibonacci(n - 2) + seqFibonacci(n - 1);
  }

  //se eu fizer isso 'resultado = 3;' ele vai dar erro pois a variavel é final e não posso alterar seu valor
  print(resultado);
  return resultado;
//esse é o return do int !
}
