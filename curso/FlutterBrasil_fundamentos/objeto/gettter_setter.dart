class Pessoa {
  String nome = '';
  //colocando _ underline a gente esta dizendo que só pode ser acessado dentro do objeto
  int _idade = 0;
  double _altura = 0.0;

  //construtor
  Pessoa(
    this.nome,
    this._idade,
    this._altura,
  );

  //construtor nomeado
  Pessoa.nascer(this.nome, this._altura) {
    //imagine um recem nascido
    //aqui passamos pro construtor o nome e a altura
    //e dissemos que a idade é 0
    _idade = 0;
    print("$nome nasceu!");
    dormir();
  }

  void dormir() {
    print("$nome está dormindo!");
  }

  void aniver() {
    _idade++;
  }

  //criando o getter
  //isso faz com que ao chamar idade fora da classe Pessoa
  //ele vai retornar a _idade que esta dentro de classe Pessoa
  //isso impede que pessoas alterem o codigo sem ser na classe
  //o getter apenas le
  int get idade {
    return _idade;
  }
  //simplificando o get acima
  //int get idade => _idade;

  double get altura {
    return _altura;
  }
  //simplificando o get acima
  //double get altura => _altura;

  //criando o setter
  //com o setter podemos alterar a variavel fora da classe
  //ou seja podemos pegar nene.idade = 18;
  //veja que fazemos uma proteção ou seja criamos uma condição que só vai poder alterar a variavel altura fora da classe
  //somente se ela for maior que 0.0 e menor que 2.5 (esses serão os valores aceitos para alterar fora da classe)
  set altura(double altura) {
    if (altura > 0.0 && altura < 2.5) {
      _altura = altura;
    }
  }
}

//veja que nao conseguimos acesaar a variavel _idade fora da classe Pessoa
//podemos colocar _idade diretamente porém nao é a intenção!
main() {
  //o construtor serve para eu passar diretamente os dados em Pessoa(aqui passa o construtor)
  Pessoa pessoa1 = Pessoa('Vitor', 28, 1.69);
  //veja que todas essas 3 linhas abaixo, colocamos dentro da instancia
  // pessoa1.nome = "Vitor";
  // pessoa1.idade = 28;
  // pessoa1.altura = 1.69;

  //veja como passamos o construtor diretamente na instancia Pessoa('Rosana', 57, 1.55)
  Pessoa pessoa2 = Pessoa('Rosana', 57, 1.55);
  //quando crio o getter veja que nao posso mais acessar a variavel idade e altura dessa forma abaixo
  pessoa2.nome = "Rosana";
  //pessoa2.idade = 57;
  //pessoa2.altura = 1.55;

  print(pessoa1.nome);
  print(pessoa2.nome);

  pessoa1.aniver();
  print(pessoa1.idade);

  pessoa1.dormir();

  //e aqui eu instancio o construtor nomeado
  Pessoa nene = Pessoa.nascer('Ariella', 0.30);
  print(nene.nome);
  print(nene.idade);

  //veja como podemos usar o set para fazer alterações
  //porém ele tem a condição que impomos que é maior que 0 e menor que 2.5
  //ele só aceitara os valores entre 0.0 até 2.5
  nene.altura = 2.0;
}

//Getter and Setter = em algum momento eu vou querer que alguns atributos da nossa classe nao sejam
//acessiveis por fora do objeto
//exemplo a nossa idade, eu nao quero ser capaz de por fora do nosso objeto alterar a nossa idade, fora o metodo aniver
//ou seja isso evita nene.idade = 18; e nos da mais segurança !!

//getter e setter = protegem o codigo
//só utilize eles quando o codigo realmente precisa ser protegido
