class Cafe {
  //se eu nao inicializar essa variavel(ou seja nao passar valor para ela)
  //devemos inicializar ela no construtor !

  //utilizamos o late pois estou dizendo ao dart analyzer que eu garanto que eu vo por um valor nessa variavel
  //antes mesmo de ler o valor dela
  //ou seja quando eu desenvolver esse codigo eu sei que vou chamar o 'quente' ou 'frio'
  //antes mesmo do 'beber'
  //com isso eu vou atribuir um valor ao _temperatura
  late String _temperatura;

  void calor() {
    _temperatura = 'quente';
  }

  void gelado() {
    _temperatura = 'frio';
  }

  String beber() => 'Café' + _temperatura;

  //OBS: sempre tenha em mente que quando voce chama o late voce precisa ter certeza de que logo em seguida essa variavel vai ter um valor !
  //entao tenha certeza de que a variavel vai ser inicializada(atribuida um valor) antes de ser inicializada !
}
