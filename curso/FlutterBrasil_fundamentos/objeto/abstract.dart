//abstract = impede que voce crie um objeto para essa classe(ele nao deixa instanciar um objeto no main)
//porém ainda posso fazer ela como classe pai para fazer os extends !
//eu tambem posso declarar metodos sem um corpo (para ser reescrito em outras classes filhas)
//corpo do metodo são as {}
abstract class Animal {
  String nome = '';
  double peso = 0.0;

  Animal(this.nome, this.peso);

  void comer() {
    print("$nome comeu");
  }

  void fazerSom() {
    print("$nome fez um som");
  }

  //fazendo isso um metodo vazio numa classe abstract
  //eu sou automaticamente obrigado a coloca-la nas classes filho!!!
  void metodoVazio();

  //tome muito cuidado ao usar o toString() na classe pai
  //pois automaticamente as classes que extends dela se nao tiver o metodo toString()
  //e voce fizer um print(gato) por exemplo
  //ele automaticamente vai pegar os dados que esta aqui e usar na classe gato porém com os atributos da classe gato!
  @override
  String toString() {
    return "Animal | Nome: $nome, Peso: $peso";
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

  @override
  void fazerSom() {
    print("$nome fez au au");
  }

  @override
  String toString() {
    return "Cachorro | Nome: $nome, Peso: $peso, Fofura: $fofura";
  }

  //veja que sou obrigado a fazer um override do metodoVazio() aqui
  //pois quando utilizo abstract e coloco um metodo vazio na classe pai
  //eu preciso fazer um override dela aqui!
  @override
  void metodoVazio() {
    print("sou obrigado a passar esse metodo");
  }
}

class Gato extends Animal {
  Gato(String nome, double peso) : super(nome, peso);

  bool estaAmigavel() {
    return true;
  }

  @override
  void fazerSom() {
    print("$nome fez miau");
  }

  //veja que sou obrigado a fazer um override do metodoVazio() aqui
  //pois quando utilizo abstract e coloco um metodo vazio na classe pai
  //eu preciso fazer um override dela aqui!
  @override
  void metodoVazio() {
    print("sou obrigado a passar esse metodo");
  }
}

main() {
  Cachorro cachorro = Cachorro("Doguinho", 15.5, 100);
  cachorro.fazerSom();
  cachorro.brincar();
  cachorro.comer();

  print(cachorro);

  Gato gato = Gato("Gatinho", 10.0);
  print('Esta amigavel? ${gato.estaAmigavel()}');
  gato.comer();
  gato.fazerSom();

  //repare que a classe gato não tem um override de toString, quem tem é a classe animal
  //repare se eu der print(gato) como ela é extends animal ela automaticamente se atribui desse metodo!
  print(gato);

  //como utilizei abstract na class animal eu nao posso mais instanciar ela
  //Animal animal = Animal('Rex', 20.0);
  //print(animal);
}
