//Analise de fluxo

//Uma observação importante, quando voce construir esse metodo ele vai dar varios erros de cara
//porém termine ele para ver os erros, nao fique preso no inicio !!!!
//pois quando chegar ao final talvez todos erros sumiram
bool listVazia(Object objeto) {
  if (objeto is List) {
    return objeto.isEmpty;
  } else {
    return false;
  }
}
//nesse exemplo ele vai verificar se o objeto é uma lista
//se for uma lista ele promove para tipo List

//outro exemplo (porém esse nao usa nullsafety, ele faz a mesma coisa que o de cima)
bool listaVazia(Object objeto) {
  if (objeto is! List)
    return false; //antes do nullSafety esse return nao era levado em consideração, ou seja o dart acha que ele nao era um codigo
  //agora com nullSafety ele leva em consideração, le esse return e se for falso vai para o proximo !!
  return objeto.isEmpty;
}
//aqui ele verifica se o objeto nao é uma lista 'is!'
//se nao for do tipo list retorna falso
//se nao for do tipo lista ele tenta chamar o 'return objeto.isEmpty' e isso o promoveria para List

//Resumindo agora o dart nullSafety leva em consideração quando usamos: Return, break, throw
//então tome cuidado !!
