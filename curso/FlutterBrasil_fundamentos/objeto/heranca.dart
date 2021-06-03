//Obs em dart podemos herdar apenas 1 classe

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
//Para fazer com que uma classe consiga pegar atributos de outra classe
//devemos sempre por 'extends' e o nome da classe que vai ser pego as coisas

//repare que na classe gato e cachorro eu comentei varios codigos, pois ele estão dentro da classe Animal
//e como eu vou herdar caracteristicas de Animal eu nao preciso te-las na classe gato e cachorro

class Cachorro extends Animal {
  //variaveis de inicialização
  // String nome = '';
  // double peso = 0.0;
  int fofura = 0;

  //construtor
  //quando eu vou pegar variavel da classe pai eu nao posso colocar como this.nome, this.peso
  //eu tenho que colocar no construtor como string nome, double peso
  //como a fofura esta aqui ai sim eu posso colocar como this.fofura
  Cachorro(
    String nome,
    double peso,
    this.fofura,
  ) : super(nome, peso);
  //sempre que eu fizer herança e na classe pai tiver um construtor eu preciso por o super aqui !!
  //repare que preciso por o super aqui para que nome e peso consiga acessar o construtor da classe Animal
  //o super vai fazer o papel do this
  //lembre-se de criar um construtor na classe animal tambem !!

  //metodos(funções)
  // void comer() {
  //   print("$nome comeu");
  // }

  // void fazerSom() {
  //   print("$nome fez um som");
  // }

  //repare que esse metodo e a variavel fofura só vai ter aqui na classe Cachorro
  void brincar() {
    fofura += 10;
    print("Fofura do $nome aumentou para $fofura");
  }
}

class Gato extends Animal {
  //variaveis de inicialização
  // String nome = '';
  // double peso = 0.0;

  //construtor
  Gato(String nome, double peso) : super(nome, peso);

  //metodos(funções)
  // void comer() {
  //   print("$nome comeu");
  // }

  // void fazerSom() {
  //   print("$nome fez um som");
  // }

  //repare que esse metodo só temos aqui na classe Gato
  bool estaAmigavel() {
    return true;
  }
}

main() {
  //se eu nao tiver um construtor feito eu nao consigo passar parametros diretamente aqui
  Cachorro cachorro = Cachorro("Doguinho", 15.5, 100);
  cachorro.fazerSom();
  cachorro.brincar();
  cachorro.comer();

  Gato gato = Gato("Gatinho", 10.0);
  print('Esta amigavel? ${gato.estaAmigavel()}');
  gato.comer();
  gato.fazerSom();
}
