main(){
  bool valorAtivo = true;

  List<int> lista1 = [1, 2, 3];
  List<int> lista2 = [4, 5, 6];

  var lista3 = null;


//olha só que interessante, nos conseguimos concatecar as lista usando operador spread (...) 
//e alem disso eu consigo colocar uma condição (if) dentro da lista !!!
  var listaTotal = [0, ...lista1, ...lista2, if(valorAtivo) 7];


  //imagine que eu coloque uma lista de valor nulo dentro dessa outra lista(e nao sei)
  //para poder conferir eu coloco um '?' antes da lista (...?lista3)
  //ou seja com isso '?' ele diz o seguinte, se essa lista não for nula ele espalha os valores dentro da listaTotal1
  //agora se for nula o listaTotal1 vai ignorar ela !
  //com isso vai evitar um erro de expection
  var listaTotal1 = [0, ...lista1, ...lista2, ...?lista3];


  print(listaTotal);
}