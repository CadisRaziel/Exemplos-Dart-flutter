class Produto {
  //variaveis de inicialização(lembrar de tirar o ?)
  int codigo = 0;
  String nome = '';
  double preco = 0.0;
  double desconto = 0;

  //construtor nomeado
  Produto({
    required this.codigo,
    required this.nome,
    required this.preco,
    this.desconto = 0,
  });

  //criando um get
  double get precoComDesconto {
    //calculando o preço com desconto !
    // 1 = 100% (0.15 = 15%)
    return (1 - desconto) * preco;
  }
}
