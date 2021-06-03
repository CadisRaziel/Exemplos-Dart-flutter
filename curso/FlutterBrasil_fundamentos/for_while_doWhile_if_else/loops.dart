void main() {
  //printar numeros de 1 a 5
  //usamos quando sabemos o numero de repetições queremos
  for (int i = 0; i <= 10; i++) {
    print(i);
  }

  //while
  //usamos quando não sabemos o numero de repetições
  int j = 0;
  while (j < 10) {
    print(j);
    j++;
  }

  //do while
  //usamos quando não sabemos o numero de reptições, porém ele executa 1 vez antes de conferir de é true ou false
  int k = 0;
  do {
    print(k);
    k++;
  } while (k < 10);
}
