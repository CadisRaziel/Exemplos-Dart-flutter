import '../modelo/cliente.dart';
import '../modelo/produto.dart';
import '../modelo/venda.dart';
import '../modelo/venda_item.dart';

main() {
  //posso colcoar dentro de uma variavel
  var vendaItem1 = VendaItem(
      quantidade: 30,
      produto:
          Produto(codigo: 1, nome: 'Lapis Preto', preco: 6.0, desconto: 0.5));

  //repare que como criamos construtores nomeados na pasta modelo e nos modulos venda e cliente
  //precisamos passar esses parametros nomeados aqui
  var venda = Venda(
      cliente: Cliente(nome: 'Vitor Brussolo Zerbato', cpf: '123.456.789-00'),
      itens: <VendaItem>[
        vendaItem1, //aqui eu coloco minha varaivel com a composição

        //e abaixo eu tenho os objetos sendo instanciados diretamente na lista
        VendaItem(
            quantidade: 20,
            produto: Produto(
                codigo: 2, nome: 'Caderno', preco: 20.00, desconto: 0.25)),
        VendaItem(
            quantidade: 100,
            produto: Produto(
                codigo: 3, nome: 'Borracha', preco: 2.00, desconto: 0.5))
      ]);

  print("O valor total da venda é R\$${venda.valotTotal}");
}
