class DataSimples {
  //aqui vamos aprender a usar classes e metodos !

  int? dia;
  int? mes;
  late int ano;

  //uma função dentro de uma classe tem o nome de 'Metodo'
  //e essa função tem os mesmo atributos de uma classe normal
  //repare que eu ia colocar como parametro 'int dia, int mes, int ano
  //porém não é necessario pois esse parametro ja esta dentro da class!!!
  //porém observe esse metodo ele nao retorna nada, ou seja eu nao consigo apresenta-lo no app
  //ele só sera apresentado no terminal
  obterData(/*int dia, int mes, int ano*/) {
    print("$dia/$mes/$ano");
  }

  //repare que eu posso chamar um metodo em outro
  //para que esse metodo seja apresentado
  //eu retorno algo dele
  //então farei assim:
  String obterData1() {
    return "$dia/$mes/$ano";
  }

  //uma observação
  //quando eu faço isso la no main
  //print(obterData1) ele vai mostrar o seguinte = Instance of 'DataSimples'
  //para eu mostrar outra mensagem ou um metodo eu faço assim
  String toString() {
    return obterData1();
  }
}

main() {
  var dataAniversario = new DataSimples();
  dataAniversario.dia = 3;
  dataAniversario.mes = 05;
  dataAniversario.ano = 2021;

  //repare que posso usar a mesma classe para criar outros objetos
  DataSimples dataCompra = DataSimples();
  dataCompra.dia = 06;
  dataCompra.mes = 05;
  dataCompra.ano = 2021;

  //criando o metodo 'obterData' dentro da classe eu nao preciso usar um print aqui para apresenta-la
  //print("${dataAniversario.dia}/${dataAniversario.mes}/${dataAniversario.ano}");

  //porém como eu informei la na classe desse modo ele não vai apresentar nada na tela
  //só sera apresentado no terminal
  dataAniversario.obterData();
  dataCompra.obterData();

  //para apresentar pro usuario eu faço isso
  //repare que o metodo é diferente obterData1 e não obterData
  String d1 = dataAniversario.obterData1();
  print("A data apresentada foi $d1");

  //colocando diretamente o metodo no print sem criar armazenar em uma varaivel
  print(
      "A data apresentada sem estar armazenada na varaivel é ${dataCompra.obterData1()}");

  //mostrando o metodo toString cliado la na classe(leia a observação)
  //repare que agora ao invez de ser mostrado 'Instance of DataSimples' sera mostrado o metodo obterData1
  print(dataCompra);
}
