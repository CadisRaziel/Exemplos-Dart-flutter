main() {
  //o final é uma constante, e eu coloquei em uma lista
  //porém isso nao faz com que a lista em si seja uma constante
  //no caso eu nao posso atribuir algo diferente para "lista"(veja no exemplo 1)
  final lista = ['Ana', 'Lia', 'Gui'];
  lista.add('Rebeca');

  //exemplo1
  //veja que por ser final eu nao posso criar uma nova lista com o nome "lista"
  //porém olhe a diferença, eu consigo ADD e REMOVER itens da lista
  //porém não posso criar outra lista com o nome "lista"
  //lista = ['Banana', 'maça'];

  print(lista);

  //para evitar que os nomes da lista seja alterado ou adiciona ou removido eu faço isso
  //coloco o const !
  //posso deixar var list1 = const (tambem)
  final lista1 = const ['Ana', 'Lia', 'Gui'];
  lista.add('Rebeca');

  print(lista1);
}
