//fazendo o import de um modulo(arquivo)
import '01_arquivo_pessoa_import.dart';

main() {
  //aqui estou importando a classe Pessoa do modulo(arquivo) arquivo_pessoa_import.dart
  var p1 = Pessoa();
  p1.nome = 'João';

  print("O nome da pessoa é ${p1.nome}");
}
