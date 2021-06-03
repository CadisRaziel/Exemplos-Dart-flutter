import 'produto.dart';

class VendaItem {
  //variaveis de inicialização(lembrar de tirar o ?)
  Produto produto;
  int quantidade;
  double? _preco;

  //criando construtor nomeado
  VendaItem({
    required this.produto,
    this.quantidade = 1,
  });

  double get preco {
    _preco = produto.precoComDesconto;
    return _preco!;
  }

  void set preco(double novoPreco) {
    //codição para verificar que o preço não seja negativo ou 0
    if (novoPreco > 0) {
      _preco = novoPreco;
    }
  }
}
