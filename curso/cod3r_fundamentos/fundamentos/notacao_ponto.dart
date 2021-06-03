main() {
  //notação ponto é colocar o valor e um . (ao colocar o . ele te mostra uma serie de funcoes que é permitido)
  //ou seja coloquei .roundToDouble, ele vai arredondar a nota para 7.0
  double nota = 6.99.roundToDouble();
  print(nota);

  //truncateToDouble = tira as casas decimais
  //ou seja como é 6.99 ele vai para 6.0
  double nota1 = 6.99.truncateToDouble();
  print(nota1);

  //posso usar diretamente tambem
  print("Texto".toUpperCase());

  String s1 = "leonardo leitão";
  String s2 = s1.substring(0, 8); //vai pegar a primeira letra até a 8 letra
  print(s2);

  String s3 = s2.toUpperCase(); //vai apresentar tudo em maiuscula
  print(s3);

  //vai completa a string que tem 8 letras para 15 letras, e definimos que o ! como ola tem 3 letras ele vai precisar de mais 12 "!"
  String s5 = "Olá";
  String s4 = s5.padRight(15, "!");
  print(s4);

  //posso fazer pegag todas essas string e fazer um encadeamento exemplo
  var s6 = "leonardo leitão".substring(0, 8).toLowerCase().padRight(15, "!");
  print(s6);
  //uma observação como  toUperCase retorna uma string o proximo . pode ser de algo relacionado a string
  //o padright retorna um int, então o proximo . tem que ser relacionado a algum metodo que use int
  //para saber o que os metodos retorna coloque o mouse por cima e verifique
}
