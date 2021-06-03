main() {
  for (int a = 0; a < 10; a++) {
    if (a == 6) {
      break;
    }
    print(a);
  }

  print('chegou no numero 6 e o break parou o codigo e saiu do laço for');

  //exemplo 2 com continue
  for (int a = 0; a < 10; a++) {
    if (a % 2 == 0) {
      //ele vai pegar todos numeros pares e vai ignora-los só apresentado os impares
      //ou seja ele interrompe na hora que chega um numero par e continua ate achar um impar
      continue;
    }
    print(a);
  }

  print(
      'como eu coloquei a % 2 == 0 ele vai ignorar os numeros pares e vai continuar o codigo e apresentar os numeros impares ');
}
