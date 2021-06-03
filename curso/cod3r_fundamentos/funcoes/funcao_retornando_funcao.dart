//aqui eu vou criar uma função somaParcial que retorna uma function(e essa function retorna um INT)
int Function(int) somaParcial(int a) {
  int c = 0;

  //aqui eu retorno uma função anonima int b
  //esse retorno é do int Function (int)
  return (int b) {
    //esse return aqui eu tenho acesso ao parametro de somaParcial(int a)
    //e a variaveis que eu posso criar antes do return(int b)
    //esse return é da função somaParcial
    return a + b + c;
  };
}

main() {
  //repare que o soma parcial retorna apenas 1 int
  //para eu passar o parametro da Function(int) eu coloco mais um ()
  print(somaParcial(2)(8));

  //como no exemplo anterior de passando uma função como parametro posso fazer isso
  //salvar a função em uma variavel
  //e passar ela com um valor
  var somaCom10 = somaParcial(10);
  print(somaCom10(5));

  //esse recurso otimiza muito tempo para algoritimos pesados !!
}
