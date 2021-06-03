main() {
  var notas = [8.2, 7.1, 6.2, 4.4, 3.9, 8.8, 9.1, 5.1];

  //vamos criar uma função que recebe um parametro double e que retorna um valor booleano
  //como parametro essa função vai receber uma nota que retorna um double
  //e o criterio que vamos usar é o nota for igual ou maior que 7 (que no caso é um verdadeiro ou falso)
  //com isso vai pegar somente as notas maior ou igual a 7
  bool Function(double) notasBoasFn = (double nota) => nota >= 7;

  //agora para gerar a lista filtrada fazemos isso
  var notasBoas = notas.where(notasBoasFn);
  print(notasBoas);

  //where() = recebe uma função que retorna um valor do tipo boolean que tem como parametro um double
  //ou seja se o resultado da função notasBoasFn for verdadeiro ele vai fazer parte do Iterable do metodo 'where'
  //se for false ele não fara parte do iterable e sera tirado do resultado final

  //RESUMINDO, aqui é bem mais facil do que criar um laço FOR
  //pois com apenas 1 linha de codigo conseguimos fazer a função notasBoasFn

  //posso fazer a função sem especifica-la
  var notasMuitoBoasFn = (double nota) => nota >= 8.8;

  //e aqui apresentamos a função sem especificar
  var notasMuitoBoasMesmo = notas.where(notasMuitoBoasFn);
  print(notasMuitoBoasMesmo);
}
