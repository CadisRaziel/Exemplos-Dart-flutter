//essa class com nullSafety não vai funcionar, pois vai me da um valor nullo

//LEMNRE-SE UTILIZAE O ! (NULL ASSERTION) QUANDO O CAMPO É UM CAMPO ARMAZENADO (QUANDO NOS DEV COLOCA O VALOR) E NÃO COMPUTADO(QUANDO O USUARIO COLOCA O VALOR)
class Cafe {
  String? _temperatura;

  void calor() {
    _temperatura = 'quente';
  }

  void gelado() {
    _temperatura = 'frio';
  }

  //verifica se a temperatura é nula ou não antes de utiliza-la
  void checkTemp() {
    //outro metodo melhor para fazer
    //crio uma variavel local aqui
    //String temperatura = _temperatura;
    //e altero o _temperatura do if por temperatura (sem o underline)
    //a forma que esta nao é garatida de erros,
    //a forma do comentario é a mais garantida !
    //pois fazendo o String temperatura = _temperatura, teremos certeza absoluta que nao tera nulo assim poderemos colocar o ! sussegado
    if (_temperatura != null) {
      print('Vamos beber $_temperatura');
    }
  }

  //colocamos _temperatura! pois temos que ter certeza que o valor de _temperatura nunca será nullo
  //aqui sabemos que não sera nulo pois é um campo armazenado ou seja nós colocamos ele no codigo
  String beber() => 'Café' + _temperatura!;
}

class Errado {
  //esse codigo nao deveria dar errado, mais vai dar, sabe porque?
  //porque o get ele pode ter valor da primeira vez que é lido,porém da segunda vez pode ser nullo e dar erro no restante do codigo !!

  //porque o dart analyzer nao consegue destinguir se get _variavel é computada ou armazenada
  //lembre-se armazenada a gente poe o valor, computada o usuario coloca o valor !
  String? get _variavel {
    if (_contador == 0) {
      _contador = 1;
      return '0';
    }
    return null;
  }

  int _contador = 0;

  void verificarZero() {
    if (_variavel != null) {
      //ao chegar aqui ele vai ler todo o codigo, da primeira vez pode ter valor a _variavel
      //porém se eu escrever da forma que esta ali em cima, quando ele ler da segunda vez a _variavel será nulla
      //e ao chegar aqui ele tenta CHAMAR UM METODO, LEMBRE-SE VARIAVEIS NULAS NÃO CHAMAM METODOS !!
      //lembre-se tambem a variavel _variavel não é local do verificarZero, então ela nao consegue ser promovida
      print(_variavel.length);
    }
  }
}

class Certo {
  String? get _variavel {
    if (_contador == 0) {
      _contador = 1;
      return '0';
    }
    return null;
  }

  int _contador = 0;

  void verificarZero() {
    //para que nao der erro de nulo, criamos essa variavel 'final'
    //pois variaveis locais são promovidas
    final variavel = _variavel;
    //ao atribuir valor da _variavel na variavel, ele vai verificar se variavel é nulo ou não
    //ai sim se nao for ela consegue chamar metodos
    if (variavel != null) {
      print(variavel.length);
    }
  }
}
