class Carro {
  //Repare que eu coloquei um underline antes da velocidadeAtual
  //_velocidadeAtual
  //ou seja essa variavel agora é privada, ela não sera mais visivel fora dessa classe !
  //ou seja se eu fizer um import em algum outro modulo, eu não vou ter acesso a ela !

  //Resumindo deixando a variavel de inicilização privada ou qualquer outra variavel aqui
  //ela só sera acessivel nessa CLASSE !
  //Isso serve para metodos tambem !

  final int velocidadeMaxima;
  int _velocidadeAtual = 0;

  //construtor
  Carro([this.velocidadeMaxima = 200]);

  //get = não possui parametros porém retorna um valor !
  //set = possui um parametro mais não retorna um valor !

  //criando um getters (get)
  //fazendo o get eu consigo acessar a velocidadeAtual fora da classe
  //porém a _velocidadeAtual(com underline ainda não posso acessar fora dela)
  //porém essa é a magia do get ele consegue pega variaveis privadas e apresenta-las em outro modulo
  //ou seja o get é um metodo que vai ter acesso direto ao _velocidadeAtual(privado)
  //ele pode receber parametros se precisar!
  int get velocidadeAtual {
    return this._velocidadeAtual;
    //get le o atributo
  }

  //criando um setters(set)
  void set velocidadeAtual(int novaVelocidade) {
    //.abs = valor absoluto sem ser negativo ou positivo
    //fazendo esse criterio abaixo, se eu colocar no codigo la agora (perto do print o carro parou)
    //e colocar carro1.velocidadeAtual = 500; ele nao vai apresentar (parou na velocidade 500km/h)
    //pois o criterio do set abaixo não vai deixar esse bug acontecer !
    bool deltaValida = (_velocidadeAtual - novaVelocidade).abs() <= 5;
    if (deltaValida && novaVelocidade >= 0) {
      this._velocidadeAtual = novaVelocidade;
    }
    //set altera o atributo
  }

  int acelear() {
    if (_velocidadeAtual + 5 >= velocidadeMaxima) {
      _velocidadeAtual = velocidadeMaxima;
    } else {
      _velocidadeAtual += 5;
    }

    return _velocidadeAtual;
  }

  int frear() {
    if (_velocidadeAtual - 5 <= 0) {
      _velocidadeAtual = 0;
    } else {
      _velocidadeAtual -= 5;
    }

    return _velocidadeAtual;
  }

  bool estaNoLimite() {
    return _velocidadeAtual == velocidadeMaxima;
  }

  bool estaParado() {
    return _velocidadeAtual == 0;
  }
}
