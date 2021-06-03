class Animal {
  String cor = '';

  void dormir() {
    print("Dormir");
  }
}

class Cao extends Animal {
  //veja que somente hernando as caracteristicas de Animal eu ja posso utiliar la no main sem escrever nada aqui !
  //aqui tambem eu posso criar atributos especificos para essa classe

  double peso = 0.0;

  void latir() {
    print("O cachorro latiu");
  }
}

class Passaro extends Animal {
  //veja que somente hernando as caracteristicas de Animal eu ja posso utiliar la no main sem escrever nada aqui !

}

main() {
  Cao cachorro = Cao();
  Passaro passarin = Passaro();

  cachorro.cor = 'Preto';
  print("A cor do cachorro é ${cachorro.cor}");
  cachorro.peso = 15.5;
  print("O pesso do cachorro é ${cachorro.peso}");
  cachorro.dormir();
  cachorro.latir();

  passarin.cor = 'Azul';
  print("A cor do passarinho é ${passarin.cor}");
  passarin.dormir();
}
