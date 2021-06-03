class Pessoa {
  //aqui idade pode ser simplesmente um campo armazenado
  int idade = 30;
}

//aqui a idade não é um campo armazenado, ela é um campo computado conforme o usuario digita
class PessoaDois {
  //classe para saber a idade
  DateTime aniversario = DateTime(1992, 11, 16);
  int get idade =>
      (DateTime.now().difference(aniversario).inDays / 365).floor();
  //floor = arredonda pra baixo !
}

void main() {
  final pessoa = Pessoa();
  print(pessoa.idade);

  //=======================
  final pessoaDois = PessoaDois();
  print(pessoaDois.idade);
}

abstract class Veiculo {
  String get modelo;
  set modelo(String);
}

abstract class Veiculo2 {
  //aqui o abstract fará a mesma função do get e set !
  abstract String modelo;
}
