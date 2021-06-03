main() {
  //quando eu especifico String? eu estou dizendo que essa variavel pode ter valor null
  //quando eu especifico late String estou dizendo que mais tarde essa variavel vai ter valor sem ser nullo
  String? nome;
  late String sobrenome;
}

//repare nesse exemplo, a função calcule só vai atribuir valor na variavel 'umInt' depois de fazer seu calculo
//então utilizamos o 'late' para dizer a variavel que depois ela vai ter um valor nela e não sera mais nula
class Inteiro {
  late int umInt;

  inteiro() {
    umInt = calcule();
  }
}

calcule() {}

//OBS: UTILIZE LATE SOMENTE QUANDO VOCE TER CERTEZA QUE VOCE VAI INICIARLIZAR A VARIAVEL DEPOIS
//INICIALIZAR = ATRIBUIR VALOR A ELA.

//Resumindo quando colocamos ? na frente da variavel estamos dizendo que ela pode ser nulla
