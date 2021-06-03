class Carro {
  //varivaveis de inicialização
  //por ser final eu preciso definir no construtor o valor dela
  final int velocidadeMaxima;

  //repare aqui mesmo eu colocando late ou ? ele vai dar erro
  //poruqe o dart é contra ter variaveis nullas
  //sempre atribua algo nas variaveis de inicialização
  int velocidadeAtual = 0;

  //construtor
  Carro([this.velocidadeMaxima = 200]);

  //metodos

  //acelerar vai sempre retornar a velocidade atual
  //e sempre vai incrementar +5 sempre que chamar o metodo acelerar
  //porém sempre respeitando a velocidade maxima que é 200
  int acelear() {
    if (velocidadeAtual + 5 >= velocidadeMaxima) {
      velocidadeAtual = velocidadeMaxima;
    } else {
      velocidadeAtual += 5;
    }

    return velocidadeAtual;
  }

  //se a na hora de frear ele tira -5 e a velocidade atual for igual a 0
  //ele vai manter a velocidade atual em 0
  //se nao tira -5
  int frear() {
    if (velocidadeAtual - 5 <= 0) {
      velocidadeAtual = 0;
    } else {
      velocidadeAtual -= 5;
    }

    return velocidadeAtual;
  }

  bool estaNoLimite() {
    return velocidadeAtual == velocidadeMaxima;
  }

  bool estaParado() {
    return velocidadeAtual == 0;
  }
}
