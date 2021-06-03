import 'cliente.dart';
import 'venda_item.dart';

class Venda {
  Cliente cliente;

  //repare que coloquei o VendaItem em uma lista
  //o motivo é que a venda pode ter mais de 1 item e por isso a list cai muito bem aqui
  List<VendaItem> itens;

  //construtor nomeado
  Venda({
    required this.cliente,
    this.itens = const [],
  });

  //this.itens = const [] = para ele permitir inicializar com uma lista vazia !

  //metodo para definir o preço total, ou seja, imagine que tem 15 itens de diferentes produtos no carrinho
  //esse metodo vai somar todos eles
  double get valotTotal {
    return itens
        .map((item) => item.preco * item.quantidade)
        .reduce((vTotal, vAtual) => vTotal + vAtual);
  }
}
