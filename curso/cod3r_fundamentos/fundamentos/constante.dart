import 'dart:io'; //para poder usar stdin, stdout

main() {
  //Area da circuferencia  = PI * raio * raio
  //final = constante (const que o usuario interage)

  //porém temos a "const"
  //const = constante

  //diferença entre Final e const
  //const = compilação, ela ve o codigo primeiro ou seja se o usuario digitar vai dar erro
  //final = runtime ou seja só vai ser atribuida o final quando o usuario digitar algo
  //resumindo use const somente no que o usuario nao vai interagir
  //se o usuario for interagir use final

  //posso colocar o final com uma tipagem
  //final double
  //final string
  //final int
  //mais como o var ele consegue detectar o que o programador que utilizar

  //stdin = são as entrar ou seja, quais as entradas do pc: impressora, mouse, teclado....etc
  //stout = sao as saidas ou seja, tela, impressora
  //ou seja readLineSync = vai ler o teclado(ler o que o usuario digita)
  //stdout = assim que o usuario digita e aperta o enter ele vai mostrar na tela

//repare no ! é o null safe

  final PI = 3.1415;

  stdout.write(
      "informe o raio: "); //vai mostrar o resultado do lado do "informe o raio:" (ou seja nao coloca espaço)
  var entradaUsuario = stdin
      .readLineSync()!; //aqui o DART vai pegar uma linha que o usuario digitou e converter para um double exemplo

  final raio = double.parse(entradaUsuario); //final = constante

  var area = PI * raio * raio;

  print("o valor do aréa é: " + area.toString());
}
