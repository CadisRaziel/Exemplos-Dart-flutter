class Clima {
  //quando eu declaro uma variavel com late e colocar = uma função
  //a função nao vai ser chamada diretamente para por o valor na _temperatura
  //ou seja a função só é chamada quando eu ler ou modificar o valor de _temperatura
  //esse late se transforma em 'lazy' ou seja só vai ser utilizado quando necessario
  //dentro do metodo ver termometro podemos acessa-la com o this, podemos chamar metodos e acessar campos da classe _verTermometro()
  //se eu fizesse sem o late isso acima nao seria possivel !
  late int _temperatura = _verTermometro();
}

_verTermometro() {}
