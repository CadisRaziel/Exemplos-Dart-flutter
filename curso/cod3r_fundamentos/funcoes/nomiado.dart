main() {
  //como na função eu defini String e depois INT eu devo colocar a STRING primeiro
  saudarPessoa('Vitor', 27);

  //eu nao posso inverter os parametros!!!
  //comentei porque da erro !!!
  //saudarPessoa(27, 'Vitor');

  //utilizando as {} eu posso colocar o parametro na ordem que eu quiser
  //porém eu tenho que por o nome desse parametro como eu defini
  saudarPessoa1(idade1: 20, nome1: 'Gi');

  //posso nao passar nada que ele vai usar os valores padroes
  imprimirData();

  //como posso passar o valor nomeado, onde eu posso posicionar da forma em que eu quiser
  imprimirData(dia: 02, mes: 05, ano: 2021);

  //veja que mesmo posicionando da forma que eu quero como eu defini o print (dia/mes/ano) ele sai corretamente na ordem
  imprimirData(ano: 2021, mes: 05, dia: 02);

  //passando apenas 1 valor ele automaticamente pega os outros valores padroes
  imprimirData(dia: 02);
  imprimirData(mes: 05);
  imprimirData(ano: 2021);
}

saudarPessoa(String nome, int idade) {
  print('Ola $nome, nem parece que voce tem $idade anos.');
}

//para colocar posicionamento nos parametros fazemos isso
saudarPessoa1({String? nome1, int? idade1}) {
  print('Ola $nome1, nem parece que voce tem $idade1 anos.');
}

//vamos fazer a função do opcional que é a imprimirData
//alem de usar as {} para que possamos pocisionar eles como quisermos
//eu estou colocando valores padroes(caso o usuario nao coloque nada)
imprimirData({int dia = 1, int mes = 1, int ano = 1970}) {
  print('$dia/$mes/$ano');
}
