import 'desafio_carro.dart';

main() {
  //como defini um parametor opcional no new Carro(aqui posso por a velocidade que eu quiser)
  //porém se eu nao definir nada ele vai pegar a velocidade padrão que eu defini como 200
  var carro1 = new Carro();

  //!carro.estaNoLimite = o ! vai dizer que ele não esta no limite (uma negação)
  //pois se eu nao colocar a negação ! ele não vai apresentar a velocidade !!!
  //preciso por no 'while' pois quando dar falso ele sai do loop e apresenta o print
  while (!carro1.estaNoLimite()) {
    print("A velocidade atual é ${carro1.acelear()} Km/h.");
  }

  //ele vai executar o metodo estaParado até chegar na velocidade maxima
  print(
      "O carro chegou no máximo com velocidade ${carro1.velocidadeAtual} Km/h.");

  //se eu nao colocar a negação ! ele não executa o metodo estaParado()
  while (!carro1.estaParado()) {
    print("A velocidade atual é ${carro1.frear()} Km/h.");
  }

  //OBS IMPORTANTE
  //se eu chegar aqui nessa parte e colocar isso
  carro1.velocidadeAtual = 500;
  //nada impede o codigo dele executar, ou seja temos aqui um bug !!
  //sera resolvido na parte de getters e setters
  //fazendo o Get agora eu nao consigo alterar a velocidadeAtual aqui !!!

  //ele vai executar o metodo estaParado até chegar parar
  print("O carro parou com velocidade ${carro1.velocidadeAtual} Km/h");
}
