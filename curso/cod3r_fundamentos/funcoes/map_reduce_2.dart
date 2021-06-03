main() {
  //lembrando esse exemplo é apenas de REDUCE!
  var notas = [7.3, 5.4, 7.7, 8.1, 5.5, 4.9, 9.1, 10.0];

  var nomes = [
    'Ana',
    'Bia',
    'Nolan',
    'Ka-el',
    'Batman',
    'Aquaman',
    'Invencivel'
  ];
  print(nomes.reduce(juntar));

  //porém note o seguinte, o reduce ele tem como parametro uma função que retorna um double e essa função tem como parametro outros double
  var total = notas.reduce(somar);
  print(total);

  //usando o reduce eu posso transformar a lista em qualquer outra coisa.
  //ela é mais poderosa que o map
}

double somar(double a, double b) {
  return a + b;
}

//posso usar como string
//aqui ele vai pegar todos os nomes da lista e juntar em apenas 1 string
String juntar(String ac, String elemento) {
  //vou colocar um print para entendermos melhor o que ele faz
  print("$ac => ,$elemento");
  return "$ac, $elemento";
  //essa função vai fazer com que os nomes tenham ',' uma virgula entre eles como coloquei no return
}

//OBS: diferente do map que se a lista tem 15 elementos ele vai retornar os 15 elementos(ou seja ele transforma e o resultado e o mesmo da lista original)
//o reduce transforma em apenas 1 elemento
