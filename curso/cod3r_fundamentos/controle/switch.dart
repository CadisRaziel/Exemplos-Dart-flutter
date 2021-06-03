import 'dart:math';

main() {
  var nota = Random().nextInt(11);
  print('Sua nota foi $nota');

  switch (nota) {
    //veja que podemos colcoar varios cases e varios print no mesmo bloco break
    case 10:
    case 9:
    case 8:
      print('Quadro de honra');
      print('Parabens');
      break;
    case 7:
      print('Nota boa');
      break;
    case 6:
      print('aprovado');
      break;
    case 5:
    case 4:
      print('repvorado fazer aulas extras');
      break;
    default:
      print('reprovado direto');
  }
  print('fim');

  //suponhemos que queira pegar notas do 100 ao 0 aonde fiqeu assim
  //case 100 ao 90
  //nesse caso o switch não é agradavel então é melhor usa um for in ou um if else
  var nota2 = Random().nextInt(50);
  print(
      "Apareceu numero $nota2"); //posso deixar uma mensagem fora do if else tambem

  if (nota2 > 20) {
    print("Aprovado");
  } else if (nota2 == 10) {
    print("Recuperação");
  } else if (nota2 < 10) {
    print("Reprovado");
  }
}
