///GOOD

class UploadException {
  final Response? response;

  UploadException([this.response]);

  @override
  String toString() {
    ///repare que aqui informamos que o response recebe o construtor e com isso não precisamos atribuir o ! para
    ///ou seja nos copiamos o construtor para uma variavel local
    ///response!.url - response!.errorCode - response!.reason
    var response = this.response;
    if (response != null) {
      return 'Could not complete upload to ${response.url} '
          '(error code ${response.errorCode}): ${response.reason}.';
    }

    return 'Could not upload (no response).';
  }
}


///=======================================================================


///BAD


class UploadException {
  final Response? response;

  UploadException([this.response]);

  @override
  String toString() {
    ///repare que aqui nao informamos que o response atribui ele mesmo então eu preciso por o !
    ///response!.url - response!.errorCorde - response!.reason
    if (response != null) {
      return 'Could not complete upload to ${response!.url} '
          '(error code ${response!.errorCode}): ${response!.reason}.';
    }

    return 'Could not upload (no response).';
  }
}



// CONSIDER copiar um campo anulável para uma variável local para habilitar a promoção de tipo.
// Verificar se uma variável anulável não é igual a nullpromove a variável a um tipo não anulável. Isso permite acessar membros na variável
// e passá-la para funções que esperam um tipo não anulável. Infelizmente, a promoção só é válida para variáveis ​​e parâmetros locais, portanto,
// os campos e as variáveis ​​de nível superior não são promovidos.

// Um padrão para contornar isso é copiar o valor do campo para uma variável local. As verificações nulas nessa variável são promovidas,
// portanto, você pode tratá-la com segurança como não anulável.


// Copiar para uma variável local pode ser mais limpo e seguro do que usar !todos os locais em que o campo ou a variável de nível superior é usada:

// Tenha cuidado ao usar uma cópia local. Se você precisar escrever de volta no campo, 
//certifique-se de fazer isso e não apenas escreva na variável local. Além disso, 
//se o campo puder ser alterado enquanto o local ainda estiver no escopo, o local poderá ter um valor obsoleto. 
//Às vezes, é melhor simplesmente usar !no campo.