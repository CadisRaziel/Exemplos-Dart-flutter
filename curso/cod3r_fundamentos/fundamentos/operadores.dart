main() {
  //Operadores Aritiméticos

  int a = 7;
  int b = 3;
  int resultado = a + b;
  print(resultado);

  print(a - b);
  print(a * b);
  print(a / b);
  print(a % b);

  //não há a necessiade de colocar as operaçoes em () ele vai pegar fazer a conta na ordem correta
  print(a + b * a - b / a);

  //=================================
  //Operadores Lógicos (usa valores booleanos "verdadeiro" "falso")
  bool ehFragil = true;
  bool ehCaro = false;

  print(ehFragil && ehCaro); //&&
  print(ehFragil || ehCaro); // ||
  print(ehFragil ^
      ehCaro); // ^ operador OU exclusivo, a logica só é aplicada se um dos dois for verdadeiro(ou seja um dos dois tem que ser obrigatorio ser true)

  print(
      !ehFragil); //quando colocamos ! é o negação ou seja, se "ehFragil" é true ele vai transformar em false e vice versa

  print(
      !!ehFragil); //quando colocamos !! ele faz o codigo voltar ao seu valor original ou seja se é true ele continua true
}
