//criando e modificando listas

class Pessoa {
  String nome;
  int idade;

  Pessoa(
    this.nome,
    this.idade,
  );
}

ain() {
  List<String> nomes = ['Vitor', 'Gi'];
  //posso buscar nomes pelo indice
  print(nomes[1]);

  //posso adicionar
  nomes.add('Rosana');
  print(nomes);

  //posso ver quantos elementos tem na lista
  print(nomes.length);

  //posso remover pelo indice
  nomes.removeAt(1);
  print(nomes);

  //posso inserir um nome em uma posição que quero
  nomes.insert(1, "Gi");

  //posso verificar se a lista contem algum nome ou algum numero sei la(vai dar um valor boolean)
  print(nomes.contains('Vitor'));

  //posso armazenar objetos
  List<Pessoa> pessoas = [];
  pessoas.add(Pessoa("Mari", 30));

  //com isso vai apresentar todas os nomes que eu inclui no objeto
  for (Pessoa p in pessoas) {
    print(p.nome);
  }
}
