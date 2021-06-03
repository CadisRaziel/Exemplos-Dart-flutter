//for in
main() {
  //veja a diferença entre fazer o exercicio de demonstrar as notas no FOR e no FOR IN
  //FOR
  var notass = [8.9, 9.3, 7.8, 6.9, 9.1];
  for (var i = 0; i < notass.length; i++) {
    print("Nota ${i + 1} = ${notass[i]}");
  }

  //FOR IN
  //veja como é mais simples e eu nao preciso ter uma variavel "i" para controlar o loop
  var notas = [8.9, 9.3, 7.8, 6.9, 9.1];
  for (var nota in notas) {
    print("O valor da nota é $nota");
  }
}
