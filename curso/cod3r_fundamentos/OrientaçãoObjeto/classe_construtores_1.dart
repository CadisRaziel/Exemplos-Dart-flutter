class DataSimples {
  //aqui vamos aprender a usar construtores que recebem parametros

  //variaveis de instancias
  int? dia;
  int? mes;
  late int ano;

//==================================CONSTRUTOR==============================================================
  //construtor padrao
  //repare nessa linha de codigo
  //var dataAniversario = new DataSimples();
  //eu nao consigo passar o dia/mes/ano diretamente nela new DataSimples(06/05/2021)
  //pois esse new DataSimples(); é um construtor padrao ou seja nao posso passar metodos
  //Datasimples(){}

  //construtor que pode receber parametros
  DataSimples2(int diaInicial, int mesInicial, int anoInicial) {
    //se eu nao alterar as variaveis de instancia eu terei resultado null
    dia = diaInicial;
    mes = mesInicial;
    ano = anoInicial;
  }

  //repare que nao posso fazer com os mesmos nomes pois dara um erro de null
  DataSimples0(int dia, int mes, int ano) {
    //dara um erro de nulo por as variaveis ter o mesmo nome
    dia = dia;
    mes = mes;
    ano = ano;
  }

  //para eu poder fazer o construtor com parametros com o mesmo nome eu preciso colocar o this, repare
  //porém não é interessante eu fazer isso
  DataSimples1(int dia, int mes, int ano) {
    //o this serve pra eu dizer que o dia,mes,ano não é desse metodo, mas sim da classe(as variaveis de instancia)
    this.dia = dia;
    this.mes = mes;
    this.ano = ano;
  }

  //ou posso fazer o exemplo acima de uma forma bem mais simples
  //forma mais RAPIDA E FACIL !
  DataSimples(this.dia, this.mes, this.ano);
  //posso colocar como parametro opcional
  //DataSimples([this.dia = 1, this.mes = 1, this.ano = 1970]);

//==================================FIM CONSTRUTOR==============================================================

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
  //repare que eu posso passar as datas diretamente na instancia !!
  var dataAniversario = new DataSimples(01, 02, 2021);
  // dataAniversario.dia = 3;
  // dataAniversario.mes = 05;
  // dataAniversario.ano = 2021;

  //veja que quando eu crio um construtor que pode receber parametros eu ainda posso continuar alterando ele dessa forma
  DataSimples dataCompra = DataSimples(16, 05, 2021);
  //se eu nao usa nenhum valor abaixo, ele vai atribuir o valor do parametro !
  dataCompra.dia = 06;
  dataCompra.mes = 05;
  dataCompra.ano = 2021;

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

  //apresentando com o parametro opcional
  // print(new DataSimples());
  // print(DataSimples(31)); // 31/1/1970
  // print(DataSimples(31, 12)); // 31/12/1970
  // print(DataSimples(31, 12, 2021)); // 31/12/2021
  //se eu nao colocar nenhum parametro ele vai apresentar como o valor padrao que é 1/1/1970
}
