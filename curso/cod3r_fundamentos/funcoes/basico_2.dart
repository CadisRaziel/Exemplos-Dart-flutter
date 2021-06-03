import 'dart:math';

main() {
  //para que eu possa guardar a função em uma variavel
  //para poder pegar o resultado dela e fazer alguma outra coisa
  //eu preciso especificar a função, veja o exemplo 1 e o exemplo 2

  //exemplo 1 (nao temos nada retornando)
  somar(2, 5);

  //exemplo 2
  //agora eu consigo armazenar o resultado dela em uma variavel
  //pois estou retornando algo
  int resultado = somar2(2, 8);
  resultado *= 2;
  print("Dividindo o resultado por 2: $resultado");

  //exemplo 3
  print("O resultado aleatorio é: ${retornaNumerosAleatorios()}");
}

//exemplo 1
void somar(int a, int b) {
  print(a + b);
}

//exemplo 2
//para fazer a função retornar algo
//eu preciso especificar ela, tipo ao invez de void eu especifico o que ela é
//ou seja aqui estou dizendo que ela vai retornar um tipo INT
int somar2(int a, int b) {
  return a + b; //aqui estou retornando algo

  //caso eu nao coloque esse return
  //eu preciso colocar "int?"
  //se nao vai dar um erro de nulo(pois nao to colocando o return)
}

//exemplo 3
//para retornar algo lembre-se sempre de especificar a função "int, string, double, num"
//e lembre-se sempre de por o return com o que vai ser retornado !!!
int retornaNumerosAleatorios() {
  int a = Random().nextInt(11);
  int b = Random().nextInt(11);
  return a + b;
}
