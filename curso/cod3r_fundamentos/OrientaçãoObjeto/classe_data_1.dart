//em uma classe a primeira letra do nome sempre tem que ser maiuscula

class DataSimples {
  //a partir de uma classe posso instanciar quantos objetos eu quiser

  //Exemplo das formas que posso usar o null
  //quando eu especifico int? eu estou dizendo que essa variavel pode ter valor null
  //quando eu especifico late int estou dizendo que mais tarde essa variavel vai ter valor sem ser nullo
  int? dia;
  int? mes;
  late int ano;
}

main() {
  var dataAniversario = new DataSimples();
  dataAniversario.dia = 3;
  dataAniversario.mes = 05;
  dataAniversario.ano = 2021;

  print("${dataAniversario.dia}/${dataAniversario.mes}/${dataAniversario.ano}");
}
