//é bom usar varaiveis static quando a classe é abstract !!
//abstract class Valores{}
class Valores {
  //vamos criar uma classe so para organizar nossas const

  //quando coloco static essa variavel nao é mais do Objeto Valores, e sim da classe Valores
  static int vezesClidado = 0;
}

class Pessoa {
  //usando o final
}

main() {
  //eu quero usar o 'vezesClicado' aqui no main, porém nao queremos instanciar a classe
  //para nao instanciar utilizamos o static
  //entao usamos o nome da classe e a variavel criada static nela
  Valores.vezesClidado = 2;

  //esse numero nao pode ser alterado mais !
  //usado em tempo de compilação
  const numero = 3;
  print(numero);

  //imagie que eu queira que essa variavel 'pessoa' nao seja alterada em nenhum momento
  //nos usamos o final para isso
  //ela é em tempo de execução
  final Pessoa pessoa = Pessoa();
  print(pessoa);

  //eu nao posso fazer isso, veja que da erro
  //pessoa = Pessoa();
}

//static = podemos usar as variaveis sem ter que instanciar a classe como objeto
