// List (indice)
// set (chave, valor)
// Map (não é indice)
// os 3 podem ser generics
// ou seja eu posso especificalos
// List<String> , List<Int>, List<Double>
// Map<String, double>

main() {
  //usando List o que representa ela é o [] (como se fosse um array)
  List aprovados = ['Ana', 'Carlos', 'Daniel', 'Rafael'];
  // var aprovados = ['Ana', 'Carlos', 'Daniel', 'Rafael']; //posso usar com o var tambem pois ele vai entender que é uma list peleo []

  print(aprovados);

  //para pegar algum valor pelo indice fazemos assim
  print(aprovados.elementAt(2));

  //outra forma de pegar um valor pelo indice fazemos assim
  print(aprovados[3]);

  //=======================================
  //Map

//map chave e valor ou seja serao chave"string" valor"string" por isso o <String, String> !!
//(posso colocar um var no lugar de map se quiser e evitar o uso de <String, String>)
  Map<String, String> telefones = {
    //quando usamos numeros e não vamos fazer operações matematicas, é interessante colocarmos eles em string !!
    'João': '+55 (17) 99123-4567',
    'Maria': '+55 (17) 993214-5874',
    'Pedro': '+55 (17) 99456-4513',
    //lembre-se não é permitido repetir a chave(no caso aqui são os nomes)
  };

  print(telefones is Map); //para saber se realmente é um map

  //nao acessamos eles por index mais sim por chave e falor
  //aqui vai acessar chave e valor
  print(telefones['João']);

  //acessando apenas os valores
  print(telefones.values);

  //acessando apenas as chaves
  print(telefones.keys);

  //acessando chave e valor
  print(telefones.entries);

  //================================
  //SET

  //posso colcoar todo tipo de valor dentro do map
  //para saber o tipo do map é só por o mouse em cima do nome que foi criado ou seja aqui é times
  var times = {'Vasco', 'Flamengo', 'Palmeiras', 'Corinthias'};

  //se eu colocar assim
  //Set<String> time = só vai aceitar string
  //var times = ele mesmo vai ver o valor que esta sendo colcoado e vai se adaptar a ele (pode colocar qualquer valor)
  //Set = vai deixar por qualquer valor !!

  //nao conseguimos acessar por indice pois o set não é indexado
  //print(times[0]);

  //para saber se é set
  print(times is Set);

  times.add('Santos'); //podemos adicionar t

  //para saber se tem um determinado time(vai devolver um booleano)
  print(times.contains('Vasco'));

  //como não da para usar index conseguimos pegar os times assim
  //ele vai pegar o primeiro time
  print(times.first);

  //para pegar o ultimo time
  print(times.last);

  //apresenta todos os valores
  print(times);

  //UMA COISA INTERESSANTE
  //Repare que colocamos só string dentro do set
  //se tentarmos adicionar numeros inteiros ele não vai aceitar
  //o porque disso: quando colocamos varias string, ele entende que o set é do tipo string !!!
  //porém isso só acontece quando esta definido como "var"
  //se estiver definido como Set esse problema nao vai acontecer !!!

  //Observação: Diferente do list o set não aceita repetição(ou seja nomes repetido)
  //ou seja na lista podemos ter exemplo: Daniel, Daniel (ele vai devolver 2 daniel)
  //no set exemplo: Palmeiras, Palmeiras (ele só vai devolver 1 palmeiras)

  //=============================

  //generics
  //Generic é quando definimos uma List e passamos argumento ou seja
  //List <String> , List<Double>...
  List<String> frutas = ['Banana', 'maça'];
  frutas.add('melao'); //eu só posso adicionar outras STRINGS

  //Resumindo o generic é o parametro que é passado que no caso é String, ou double ou int..

  //lembre-se que map é chave e valor
  Map<String, double> salarios = {
    //aqui eu estou dizendo que a chave é string por isso passo ela primeiro e o valor é double
    'Gerente': 20000.00,
    'Vendedor': 10000.00,
    'Estágiario': 600.00
  };
}
