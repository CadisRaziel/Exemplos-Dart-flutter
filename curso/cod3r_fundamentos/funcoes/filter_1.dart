main() {
  var notas = [8.2, 7.1, 6.2, 4.4, 3.9, 8.8, 9.1, 5.1];
  //eu quero filtrar(criar uma nova lista) que só tenha notas maiores ou iguals a 7

  //forma mais natural que usam no dia a dia
  var notasBoas = [];
  for (var nota in notas) {
    if (nota >= 7) {
      notasBoas.add(nota);
    }
  }
  print(notasBoas);
  //o resultado sera uma sublista que tera as notas que eu quero filtradas da lista 'notas' original
}
