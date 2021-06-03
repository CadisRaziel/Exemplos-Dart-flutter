//perceba nesse exemplo que estamos passando uma função com parametro (Function(String), fn) e uma String valor
void executarPor(int qtde, Function(String) fn, String valor) {
  for (int i = 0; i < qtde; i++) {
    fn(valor); //repare que aqui usamos a função e a string valor como parametro dela
  }
}

//agora veja como é essa função com a Function retornando uma string
int executarPor1(int qtde, String Function(String) fn, String valor) {
  String textoCompleto = '';
  for (int i = 0; i < qtde; i++) {
    textoCompleto += fn(
        valor); //repare que aqui usamos a função e a string valor como parametro dela
  }
  return textoCompleto.length;
}

main() {
  print('Teste');
  //obs o print é uma função ou seja ele vai imprimit o 'Muito legal' 10x
  //e vai imprimir o 'Teste' uma vez porque eu coloquei ali em cima !
  executarPor(10, print, 'Muito Legal');

  //função que retorna algo
  var meuPrint = (String valor) {
    print(valor);
    return valor;
  };
  int tamanho = executarPor1(10, meuPrint, 'Maneiro');
  print('O tamanho da string é de $tamanho caracteres');
}
