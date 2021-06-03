//Never para codigos inacessiveis
//ele é um subtipo de todos os tipos (int, double, list) "Nao nullos"
//ou seja ele pode ser todos os tipos ao mesmo tempo !!

//never garante que a expressão não pode chegar ao FIM
//Deve lançar uma Exception e abortar !!
//Pode ser utilizado como um type annotation

//exemplo:
//Never não retorna nada !!
//ele esta abortando a execução da função
//ele vai começar e nunca vai terminar !!
Never tipoErrado(String tipo, Object valor) {
  throw ArgumentError('Espera $tipo, mas é ${valor.runtimeType}.');
}
//ArgumentError = exeception
