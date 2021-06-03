main() {
  var alunos = [
    {'nome': 'Alfredo', 'nota': 9.9},
    {'nome': 'Wilson', 'nota': 9.3},
    {'nome': 'Mariana', 'nota': 8.7},
    {'nome': 'Guilherme', 'nota': 8.1},
    {'nome': 'Ana', 'nota': 7.6},
    {'nome': 'Ricardo', 'nota': 6.8},
  ];

  //para calcular o total vamos precisar do Map para tirar as notas da lista
  //e vamos usar o reduce para somar todas as notas
  var total = alunos
      .map((aluno) => aluno['nota'])
      //porém repare que o nota é um 'object', então temos que converter para double e usar o roundToDouble para arredondar o valor
      .map((nota) => (nota as double).roundToDouble())
      //se eu quiser saber só os alunos aprovados, aproveitando que o valor agora é double
      //.where((nota) => nota >= 8)
      //agora vamos usar o reduce para somar todas as notas
      .reduce((ac, a) => ac + a);

  //usando o where eu ia substituir o reduce acima para essa variavel e usar o print daquela forma!
  //var notasFinais = total.reduce.reduce((ac, a) => ac + a);
  //print("O valor da média é: ${total / total.length}");

  //OBS: repare que ao colocar o mouse sobre aluno['nota'] no primeiro map, voce vera qeu ele é um object
  //e sendo um object para fazer uma soma que usa o '+' em reduce, eu preciso converter ele pra int ou double
  //pois o object nao identifica o + como operador logico

  //aqui vamos calcular a média de notas
  print("O valor da média é: ${total / alunos.length}");
}
