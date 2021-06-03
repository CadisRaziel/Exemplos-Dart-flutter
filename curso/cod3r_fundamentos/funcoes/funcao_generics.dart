main() {
  var lista = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  print(segundoElementoV1(lista));

  //passando a função generica
  //repare que o que eu atribuir aqui em <> é o que vai influenciar na lista
  //exemplo <int>, <String>
  //como eu defini uma lista com int eu devo por <int>
  //e posso armazenar ela em uma variavel
  int? segundoElementoVar = segundoElementoV2<int>(lista);
  print(segundoElementoVar);

  //COMO A LISTA É TODA DE INT EU NAO PRECISARIA PASSAR A ESPECIFICAÇÃO <int>
  int? segundoElementoVar1 = segundoElementoV2(lista);
  print(segundoElementoVar1);
}

//Object retorna todo tipo de variavel, ela verifica se é int, se é String, double, etc...
//Repare que essa ainda não é uma função generica !!!
Object segundoElementoV1(List lista) {
  //dentro dessa função eu vou pegar o 2 elemento da 'var lista'
  return lista.length >= 2 ? lista[1] : null;
}

//AQUI QUE IREMOS FAZER A FUNÇÃO GENERICA
//repare que o <E> não existe, porém colocamos ele para dizer que a lista é generica !!
E? segundoElementoV2<E>(List<E> lista) {
  //dentro dessa função eu vou pegar o 2 elemento da 'var lista'
  return lista.length >= 3 ? lista[2] : null;
}
