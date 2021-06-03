// Implicit Downcast

// Imagine um codigo que funcionava perfeitamente antes do nullSafety e migramos para o nullSafety
// e ele continua nao funciona mais

//exemplo 1
stringNaoNula(String okString) {
  print(okString.length);
}

//exemplo 2
stringSemObjeto(String okString1) {
  print(okString1.length);
}

main() {
  //exemplo 1
  //se eu tentar passar uma string nula para uma funão nao nula ele vai dar um erro !
  // String? suaString = null;
  // stringNaoNula(suaString);

  //exemplo 2
  //repare que declarei a variavel como objeto
  //o objeto é um supertipo de todas as variaveis
  //antes do nullSafety o Implicit Downcast colocava o 'as String' quando voce declarava a variavel como Object
  //agora não, nós  temos que se atentar e colocar !!!
  Object suaString = 'string';
  stringSemObjeto(suaString as String);
  //porém se certifique que a 'suaString' não é nulla, caso contrario daria erro novamente

  //exemplo 3
  //repare nessa lista
  //List<int> filtreIsso(List<int> inst) {
  //return inst.where((x) => x.isEven);
  //repare que dessa forma o where esta retornando um Iterable e nao uma list !!!!
}
