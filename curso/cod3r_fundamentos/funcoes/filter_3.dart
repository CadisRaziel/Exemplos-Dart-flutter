//criando nosso proprio 'where'

//vamos criar uma função que tem como parametro uma List e uma Function
//e a partir dessa função vai pegar os elementos da list e transformar em outra list
//criando um filter generico
List<E> filtrar<E>(List<E> lista, bool Function(E) Fn) {
  List<E> listaFiltrada = [];

  for (E elemento in lista) {
    if (Fn(elemento)) {
      listaFiltrada.add(elemento);
    }
  }
  return listaFiltrada;
}

main() {
  var notas = [8.2, 7.3, 6.8, 5.4, 2.7, 9.3];
  var boasNotasFunction = (double nota) => nota >= 7.5;

  var somenteNotasBoas = filtrar<double>(notas, boasNotasFunction);
  print(somenteNotasBoas);

  //como eu criei um filter generico <E>
  //eu posso criar listas e funções em variaveis e passar o tipo delas como parametro da função anonima
  //ou seja repare que passei String nome, poderia ser INT, BOOL, porém a lista tem que ser desses tipos !!
  var nomes = ['Ana', 'Bia', 'Rebeca', 'Gui', 'João'];
  var nomesGrandesFunction = (String nome) => nome.length >= 4;
  var somenteGrandes = filtrar<String>(nomes, nomesGrandesFunction);
  print(somenteGrandes);
}

//LEMBRE-SE, O EXEMPLO PARECE SER MAIS GRANDE E COMPLEXO QUE O FILTER_1
//PORÉM TEM O QUESITO DO TEMPO, OU SEJA PASSANDO UMA FUNCTION COMO PARAMETRO ESTAMOS OTMIZANDO TEMPO !!
//e posso utilizar essa função generica filter para varias outras coisas sem precisar recria-la
