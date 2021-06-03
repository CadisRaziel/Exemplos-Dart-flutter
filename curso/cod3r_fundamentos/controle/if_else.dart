import 'dart:math';

main() {
  var nota = Random().nextInt(
      11); //nextInt = eu quero que ele va até tal numero (coloquei 11 ou seja entre 0-10)

  if (nota >= 6) {
    print("Aprovado");
    print("Nota selecionada foi $nota.");
  } else if (nota <= 5) {
    print("Reprovado");
    print("Nota selecionada foi $nota.");
  }

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
