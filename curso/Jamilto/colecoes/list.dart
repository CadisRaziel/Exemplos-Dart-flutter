//List = usada para armazenar itens

class Usuario {
  String nome = '';
  int idade = 0;

  Usuario(
    this.nome,
    this.idade,
  );
}

main() {
  //podemos criar um List usando o var(ele vai virar um object quando colocamos varios elementos diferentes)
  var lista = ['Morango', 123, 10.0, false];
  print(lista);

  //podemos fazer especificando a variavel( com varios elementos tambem)
  List lista1 = ['Morango', 123, 10.0, false];
  print(lista1);

  //podemos especificar o elemento que vai ter nessa lista
  //ou seja definimos String, então só pode ter String nessa lista
  List<String> lista2 = ['Vitor', 'Oi', 'Tudo bom'];
  print(lista2);

  //posso usar metodos
  List<String> fruta = ['Morango', 'abacaxi'];

  //adiciona um item no final da lista
  fruta.add('Melao');

  //adiciona um item na posicão que eu quero
  fruta.insert(0, "banana");

  //posso remover
  fruta.remove('Morango');

  //posso remover pelo indice
  fruta.removeAt(2);

  //verificar itens na lista (vai retornar um valor booleano)
  print(fruta.contains('Melao'));

  //verifica a quantidade de itens na lista
  print(fruta.length);

  //armazenando objetos (recurso muito utilizado)
  //Usuario usuario = Usuario("Vitor", 28);
  List<Usuario> usuarios = [];

  //posso instanciar aqui diretamente dentro do metodo map ou instanciar ali em cima antes
  usuarios.add(Usuario("Vitor", 28));
  usuarios.add(Usuario("Gi", 21));
  usuarios.add(Usuario("Rosana", 57));
  usuarios.add(Usuario("Ari", 1));

  //para apresentar os objetos criados nessa lista (os usuarios)
  for (Usuario usuario in usuarios) {
    //vai apresentar somente os nomes
    print(usuario.nome);

    //vai apresentar nome e idade
    print("Nome: ${usuario.nome}, Idade: ${usuario.idade}");
  }

  //ficaria assim se fosse instanciado da forma convencional
  // usuarios.add( usuario );
}

//LEMBRE-SE
// Vitor, isso foi devido ao Null Safety, a classe List foi 'extinta',
//  para substituí-la, troque pelo formato literal. Apenas assim: [].

// E ficará dessa forma: List<Pessoa> pessoas = [];
