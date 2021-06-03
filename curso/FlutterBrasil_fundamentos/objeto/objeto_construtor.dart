class Pessoa {
  String nome = '';
  int idade = 0;
  double altura = 0.0;

  //construtor
  Pessoa(
    this.nome,
    this.idade,
    this.altura,
  );

  //construtor nomeado
  Pessoa.nascer(this.nome, this.altura) {
    //imagine um recem nascido
    //aqui passamos pro construtor o nome e a altura
    //e dissemos que a idade é 0
    idade = 0;
    print("$nome nasceu!");
    dormir();
  }

  void dormir() {
    print("$nome está dormindo!");
  }

  void aniver() {
    idade++;
  }
}

main() {
  //o construtor serve para eu passar diretamente os dados em Pessoa(aqui passa o construtor)
  Pessoa pessoa1 = Pessoa('Vitor', 28, 1.69);
  //veja que todas essas 3 linhas abaixo, colocamos dentro da instancia
  // pessoa1.nome = "Vitor";
  // pessoa1.idade = 28;
  // pessoa1.altura = 1.69;

  //veja como passamos o construtor diretamente na instancia Pessoa('Rosana', 57, 1.55)
  Pessoa pessoa2 = Pessoa('Rosana', 57, 1.55);
  pessoa2.nome = "Rosana";
  pessoa2.idade = 57;
  pessoa2.altura = 1.55;

  print(pessoa1.nome);
  print(pessoa2.nome);

  pessoa1.aniver();
  print(pessoa1.idade);

  pessoa1.dormir();

  //e aqui eu instancio o construtor nomeado
  Pessoa nene = Pessoa.nascer('Ariella', 0.30);
  print(nene.nome);
  print(nene.idade);
}

//Getter and Setter = em algum momento eu vou querer que alguns atributos da nossa classe nao sejam
//acessiveis por fora do objeto
//exemplo a nossa idade, eu nao quero ser capaz de por fora do nosso objeto alterar a nossa idade, fora o metodo aniver
//ou seja isso evita nene.idade = 18; e nos da mais segurança !!
