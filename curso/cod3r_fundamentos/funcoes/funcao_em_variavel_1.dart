main() {
  //ARMAZENANDO FUNÇÕES EM VARIAVEIS !!

  // uma variavel "função" que vai realizar as açoes da funçao somaFn
  int Function(int, int) soma1 = somaFn;
  print(soma1(2, 5));

  //uma função anonima(sem nome), só faz sentido se eu armazenar em uma variavel ou se eu ja logo usar ela
  //a função anomima esta após o "="
  //repare que ele nao esta realizando a ação de nenhuma função, ele esta criando a propria(uma função anonima)
  //lembrando que é uma variavel em forma de função
  int Function(int, int) soma2 = (int x, int y) {
    return x + y;
  };
  print(soma2(5, 5));

  //posso fazer isso tambem
  //colocando var ele vai colocar o x e y como dynamic
  //eu posso definir o x e y assim (int x, int y) para especificar que a função é int
  var soma3 = (x, y) {
    return x + y;
  };
  print(soma3(10, 10));

  //lembrando essas funções armazenadas em variaveis
  //elas tem o mesmo poder que funções normais
  //ou seja posso colocar {} para fazer um parametro nomiado
  //posso colocar [] para fazer um parametro opcional
}

int somaFn(int a, int b) {
  return a + b;
}
