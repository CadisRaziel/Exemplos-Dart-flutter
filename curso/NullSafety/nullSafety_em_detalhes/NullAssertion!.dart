//NullAssertion é basicamente esse operador: !
//ele converte uma variavel nullable em uma variavel non-nullable para poder chamar metodos para essa variavel!

//exemplo
class HttpResponse {
  final int code;
  final String? error;

  HttpResponse.ok() : code = 200;
  HttpResponse.notFound()
      : code = 404,
        error = 'Not found';

  //repare que como o final String? error é nullable ele não consegue chamar metodos !!!

  //para que o erro suma e eu consiga chamar esse metodo mais correndo o risco de ser nullo
  //eu coloco o operador !
  //${error!.toUpperCase()}
  String toString() {
    if (code == 200) return 'Ok';
    return 'ERROR $code ${error.toUpperCase()}';
  }

//para corrigir podemos fazer isso
//utilizar o 'as' para podermos tipar o error
  String toString1() {
    if (code == 200) return 'Ok';
    return 'ERROR ${(error as String).toUpperCase()}';
  }

//ou podemos utilizar o operador ! que tem quase a mesma função do as
//porém ele não tipa o error
  String toString2() {
    if (code == 200) return 'Ok';
    return 'ERROR ${error!.toUpperCase()}';
  }

  //Tome cuidado pois quando chamamos esses 2 operadores devemos ter certeza que a variavel não vai ser mais nula
  //outro cuidado é que os dois sao compilados em tempo de EXECUÇÂO, ou seja quando o usuario utilizar pode dar erro na tela dele

  //OBS = 'as' e '!' dizemos ao dart que é certeza que nao vai ter um valor nullo e com isso podemos chamar metodos
}
