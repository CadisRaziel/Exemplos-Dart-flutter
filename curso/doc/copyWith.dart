///copyWith é um construtor que retorna uma nova instância do objeto
/// substituindo os itens que precisam ser alterados e repetindo os itens que não sofreram alteração. 


class People {
  final String name;
  final int old;
  final int doc;
  final String nickname;

  //gerando um construtor
  People({
    required this.name,
    required this.old,
    required this.doc,
    required this.nickname,
  });

  //gerando o copyWith clicnado com CTLR + . sobre alguma variavel final la em cima ele ja da a opção de construir os dois !
  People copyWith({
    String? name,
    int? old,
    int? doc,
    String? nickname,
  }) {
    return People(
      name: name ?? this.name,
      old: old ?? this.old,
      doc: doc ?? this.doc,
      nickname: nickname ?? this.nickname,
    );
  }
}

main(){
  var pessoa = People(name: 'Vitor', nickname: 'Vihhstx', doc: 20, old: 28);
  print(pessoa.name);
  print(pessoa.old);
  print(pessoa.hashCode);

  pessoa = pessoa.copyWith(name: 'Brussolo', nickname: 'Zerbato', old: 29);
  print(pessoa.name);
  print(pessoa.old);
  print(pessoa.hashCode);

}

//repare que os hashCode são diferentes, ou seja ele não atribuiu o nome a mesma variavel, ele atribuiu em uma nova !
//com isso alocamos em um outro espaço na memoria e não no mesmo !

///Fonte: https://medium.com/flutterando/o-padr%C3%A3o-copywith-no-flutter-dart-267e3d218ffc