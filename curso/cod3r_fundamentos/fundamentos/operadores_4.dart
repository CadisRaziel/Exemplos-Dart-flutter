import 'dart:io';

main() {
  print("Está chovendo? (s/N)");
  final estaChovendo = stdin.readLineSync() == "s";

  print("Está frio? (s/N)");
  var estaFrio = stdin.readLineSync() == "s";

  String resultado = estaChovendo || estaFrio ? "Ficar em casa" : "Sair";
  // parte 1 = estaChovendo || estaFrio (vai retornar verdadeiro ou falso dessa expressão)
  // parte 2 = ? "Ficar em casa" (caso a expressão seja veradeira ele atribui o Ficar em casa)
  // parte 3 = : "Sair"; (caso a expressão seja falsa ela atribuiu o Sair)
}
