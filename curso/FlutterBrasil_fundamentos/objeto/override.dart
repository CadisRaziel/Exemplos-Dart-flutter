//@override = sobrescrita dos metodos

//Uma curiosidade: toda classe mesmo sem usar extends, ela vai ter um extends invisivel de uma classe Object
//e essa classe Object tem um metodo chamado toString()
//e podemos reescrever esse metodo tambem, olhe nos exemplos abaixo !

class Animal {
  String nome = '';
  double peso = 0.0;

  Animal(this.nome, this.peso);

  void comer() {
    print("$nome comeu");
  }

  void fazerSom() {
    print("$nome fez um som");
  }
}

class Cachorro extends Animal {
  int fofura = 0;

  Cachorro(
    String nome,
    double peso,
    this.fofura,
  ) : super(nome, peso);

  void brincar() {
    fofura += 10;
    print("Fofura do $nome aumentou para $fofura");
  }

  //veja como resscrevemos o conteudo desse metodo!!
  //lembre-se ele nao vai pegar o metodo fazerSom() da classe animal
  //ele vai pegar o metodo fazerSom que sobrescrevemos auqi !!!
  @override
  void fazerSom() {
    print("$nome fez au au");
  }

  //rescrevendo o metodo toString que tem na classe object como explicado no inicio la em cima
  @override
  String toString() {
    return "Cachorro | Nome: $nome, Peso: $peso, Fofura: $fofura";
  }
}

class Gato extends Animal {
  Gato(String nome, double peso) : super(nome, peso);

  bool estaAmigavel() {
    return true;
  }

  //veja como resscrevemos o conteudo desse metodo!!
  //lembre-se ele nao vai pegar o metodo fazerSom() da classe animal
  //ele vai pegar o metodo fazerSom que sobrescrevemos auqi !!!
  @override
  void fazerSom() {
    print("$nome fez miau");
  }
}

main() {
  Cachorro cachorro = Cachorro("Doguinho", 15.5, 100);
  cachorro.fazerSom();
  cachorro.brincar();
  cachorro.comer();

  //como rescrevemos o metodo toString() podemos printar ele aqui agora
  //pois o metodo ja tem um toString nele ou seja nao precisamos colocar no print(cachorro.toString());
  print(cachorro);

  Gato gato = Gato("Gatinho", 10.0);
  print('Esta amigavel? ${gato.estaAmigavel()}');
  gato.comer();
  gato.fazerSom();

  //se eu nao fizer o override toString() e tentar chamar print(gato)
  //ele vai apresentar a seguinte frase: Instance of 'gato'
  //isso é bom para debugar !
  print(gato);
}
