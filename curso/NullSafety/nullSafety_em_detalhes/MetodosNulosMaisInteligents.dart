//Metodos nullos mais inteligents

class Pessoa {
  String nome;
  String? sobrenome;

  //construtor
  Pessoa(
    this.nome,
    this.sobrenome,
  );
}

class Pessoa2 {
  String nome;
  String? sobrenome;

  //construtor
  Pessoa2(
    this.nome,
    this.sobrenome,
  );
}

main() {
  Pessoa? pessoa = Pessoa('Daniel', 'Vitor');
  //se eu tivesse passado Pessoa? pessoa; ele iria ignorar todo o resto .nome.length!
  print(pessoa.nome.length);

  //repare que como sobrenome é uma variavel nula, ele me alerta que eu preciso colocar o ? em algum lugar
  //ou seja na frente do sobrenome
  //antes eu tinha que fazer assim pessoa?.sobrenome?.length
  print(pessoa.sobrenome?.length);

  //sobrenome? é para verificar se realmente a variavel esta nula ou não, como coloquei 'Vitor'
  //ele vai verifica que nao esta nulo e vai apresentar a quantidade de letras que tem no nome Vitor

  //================
  //pessoa2
  Pessoa2? pessoa2;
  //como a pessoa2 é nulla ele ignora tudo que esta a frente do pessoa2. (por ser nulo!)
  //print(pessoa2.nome.length);
}

//Operador cascata
//se o receptor for nulo com os .. ele nem tenta chamar o method();
//receptor?..method();

//Operador Index
//imagine que temos uma lista e queremos acessar o segundo item da lista
//antes tinha que ver se a lista é nula ou não, porém agora não precisa mais
//receptor?[index];
//se o receptor for nulo ele nem tenta pegar o item da lista

//Function
//Function?.call(a, b);
