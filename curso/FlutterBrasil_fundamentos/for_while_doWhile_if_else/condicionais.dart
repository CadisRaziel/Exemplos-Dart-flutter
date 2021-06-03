//if - else if - else
main() {
  double nota = 7.0;

  if (nota < 5.0) {
    print('Exame ! :(');
    //posso colcoar quantos else if eu quiser
  } else if (nota == 10) {
    print('Voce tirou 10 xDDDD');
  } else {
    print('Sucesso =)');
  }

  //operador ternario
  bool aprovado = true;
  String info;

//ao invez de fazer esse codigo abaixo
/*
  if (aprovado) {
    info = 'Aprovado';
  } else {
    info = 'Reprovado';
  }
  */

  //podemos fazer esse codigo ternario
  info = aprovado ? "aqui é true" : "Aqui é falso";
  print(info);

  //podemos fazer isso caso a varaivel for nulla
  //é tipo um operador ternario usando nullSafety
  String? nome;
  String info2 = nome ?? "não informado";
  print(info2);
}
