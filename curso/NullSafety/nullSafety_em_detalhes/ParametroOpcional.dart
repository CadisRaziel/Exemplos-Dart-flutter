//momentos em que o null faz sentido

//Parametros Opcionais !
//neste exemplo recebemos duas variaveis como parametros, a primeira é obrigatoria que é o cafe
//a segunda é opcional que é o leite(porém repare que a String? leite aceita valores nullos)
//ou seja se nao passarmos valores as variaveis opcionais, ela tem que ter o valor nulo por default como no exemplo

fazerCafe(String cafe, [String? leite]) {
  if (leite != null) {
    print('$cafe com $leite');
  } else {
    print('apenas $cafe');
  }
}

main() {
  //repare que podemos colocar um valor no parametro opcional !
  print(fazerCafe('ParametroObrigatorio', 'parametroOpcional'));

  //se nao colocamos um valor no parametro opcional ele vai atribuir o null
  print(fazerCafe('ParametroObrigatorio'));
}
