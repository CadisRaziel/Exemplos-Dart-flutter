main() {
  //Operadores de atribuição

  //lembre-se que o num pode ser int ou double (quando dividor tera double então como ta num nao vai ter erro)
  num a = 2;
  a = a + 3;
  a += 3;
  a -= 3;
  a *= 3;
  a /= 3;
  a %= 3;

  //=================
  //Operadores Relacionas (sempre é bool "verdadeiro" "falso")
  print(3 > 2);
  print(3 >= 2);
  print(3 < 2);
  print(3 <= 3);
  print(3 != 2);
  print(3 == 3);
  print(3 == '3');
  //repare que o 3 == '3' ja vai dar false de cara pois o 3 int não é igual a um 3 string
  //no javascritp eu precisaria colocar ===

  //se seu fizer isso tambem da certo
  //ele vai veriifcar todas as contas e comparações e vai realizar na ordem
  print(2 + 5 > 3 - 1 && 4 + 7 != 7 - 4);
}
