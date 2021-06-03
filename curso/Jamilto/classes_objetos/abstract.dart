//abstract = impede que voce crie um objeto para essa classe(ele nao deixa instanciar um objeto no main)
//porém ainda posso fazer ela como classe pai para fazer os extends !
//eu tambem posso declarar metodos sem um corpo (para ser reescrito em outras classes filhas)
//corpo do metodo são as {}

//agora essa classe pai não pode ser transformada mais em um objeto
//ou seja nao posso instanciar ela no main()
abstract class Animal {
  String cor = '';

  //posso passar metodos com corpo ! (elas sao opcionais, chamamos quando quisermos)
  void correr() {
    print('O animal correu');
  }

  //posso passar metodo sem corpo ! (as classes filhas sao obrigadas a passar esse metodo)
  void pular();
}

class Cao extends Animal {
  void latir() {
    print('O cao latiu');
  }

  //eu posso sobrescrever o metodo obrigátorio !!!!
  @override
  void pular() {
    print('O cachorro pulou');
  }
}

class Passaro extends Animal {
  void voar() {
    print('O passaro voou');
  }

  //repare que ele acusa um erro se eu nao passar o metodo pular
  //pois como nao dei um corpo para ele, a classe pai que é abstract fala que é obrigatorio as classes filhas terem ele
}

main() {
  Cao dog = Cao();
  dog.latir();

  //veja que podemos usar tudo da classe pai mesmo ela sendo abstract
  dog.correr();
}
