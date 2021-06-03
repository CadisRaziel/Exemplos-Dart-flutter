class Animal {
  String cor = '';

  void dormir() {
    print("Dormir");
  }

  void correr() {
    print("Correr");
  }

  void correr2() {
    print("Correr como um");
  }
}

class Cao extends Animal {
  double peso = 0.0;

  void latir() {
    print("O cachorro latiu");
  }

  //sobrescrevendo um metodo da classe pai
  //copie o metodo da classe pai e cole aqui, e altere ele como quiser
  //e quando utilizarmos no main o que sera apresentado vai ser o correr DAQUI e nao o correr da classe pai
  @override
  void correr() {
    print("O cachorro correu");
  }
}

class Passaro extends Animal {
  @override
  void correr2() {
    //quando eu coloco o super aqui eu posso utilizar ainda o metodo correr2 da classe pai mais a sobrescrita aqui
    super.correr2();
    print(" passaro");

    //qual o sentido de fazer o super
    //imagine que eu tenha varias linhas de codigo que seja conta dentro do correr2 na classe pai
    //ele primeiro vai realizar essas contas do correr2 na classe pai
    //para depois se atribuir a sobrescrtia aqui na classe passaro
  }
}

main() {
  Cao cachorro = Cao();
  Passaro passarin = Passaro();

  cachorro.correr();

  passarin.correr2();
}
