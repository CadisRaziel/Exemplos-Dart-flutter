//getters e setters
//get = 'Ler' (obter)
//set = 'alterar' (substituir)

//quando eu declaro uma variavel com _ underline eu estou dizendo que ela é privada e só pode ser aceesada pela classe
//para eu poder utiliza-la no main ou em outro lugar eu preciso usar o get

class Conta {
  double salto = 0;
  double _saque = 0;

//o get vai pegar a variavel _saque e vai dizer assim, eu quero que quando chame o saque me direcione para o _saque
  double get saque {
    //aqui dentro eu posso fazer validações
    //ver se o numero esta sendo retornado corretamente...etc
    return this._saque;
  }

//o set vai se possivel fazer a alteração do saque, sem ele não tem como alterar
  set saque(double saque) {
    //> 0 para nao ser valor negativo && <= 500 para ter um limite de saque de 500 reais
    if (saque > 0 && saque <= 500) {
      this._saque = saque;
    } else {
      print(
          "Saque de $saque não permitido, limite diário para saque é de R\$500,00");
    }
  }
}

main() {
  Conta conta = Conta();
  conta.saque = 940;

  print(conta.saque);
}
