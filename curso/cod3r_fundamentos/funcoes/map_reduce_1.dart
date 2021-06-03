main() {
  //lembrando esse exemplo é apenas de MAP! (map = para transformar!)
  var alunos = [
    {'nome': 'Alfredo', 'nota': 9.9},
    {'nome': 'Wilson', 'nota': 9.3},
    {'nome': 'Mariana', 'nota': 8.7},
    {'nome': 'Guilherme', 'nota': 8.1},
    {'nome': 'Ana', 'nota': 7.6},
    {'nome': 'Ricardo', 'nota': 6.8},
  ];

  //UMA OBSERVAÇÃO SUPER IMPORTANTE
  //repare que a primeira Function retorna uma string
  //e ao criar a 2 function eu preciso passar a String como parametro dela
  //a 2 function retorna um inteiro
  //então se eu criar uma terceira function, ela tem que passar um int como parametro!!

  String Function(Map) pegarNomes = (aluno) => aluno['nome'];
  var nomes = alunos.map(pegarNomes);
  print(nomes);

  int Function(String) qtdDeLetras = (texto) => texto.length;
  var quantidadeDeLetras = nomes.map(qtdDeLetras);
  print(quantidadeDeLetras);

  //posso fazer isso tambem
  // String Function(Map) pegarNomes = (aluno) => aluno['nome'];
  // int Function(String) qtdDeLetras = (texto) => texto.length;
  // int Function(int) dobro = (numero) => numero * 2;

  //OBS: cada map feito sempre vai sobrescrevendo o anterior, como uma variavel
  // var resultado = alunos
  //   .map(pegarNomes)
  //   .map(qtdDeLetras)
  //   .map(dobro);

  //print(resultado);
}

//RESUMINDO, A FUNÇÃO MAP TEM COMO CONCEITO PEGAR UMA LISTA E TRANSFORMAR EM OUTRA LISTA DA FORMA QUE QUISERMOS
//PORÉM IMAGINE QUE A LISTA ORIGINAL TENHA 15 ELEMENTOS, O MAP SEMPRE VAI RETORNAR UMA LISTA MODIFICADA DE 15 ELEMENTOS !!!
