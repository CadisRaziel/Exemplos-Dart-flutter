//Inicialização de variaveis

//*Variaveis superiores e campos estaticos devem ser sempre inicializadas

//lembre-se eu posso deixar elas como nula, porém na hora de executar o codigo eu nao posso deixar elas nulas
//eu tenho que atribuir algum valor para elas pois se nao da erro
//deixamos nulas só para montar o codigo !

//vairavel superior é aquela variavel que esta fora de classes
int primeiroNivel = 0;

class AlgumaClasse {
  //variavel statica é quando a variavel esta dentro da classe
  static int campoEstatico = 0;
}

//===============================================================
//Campos de instancia devem ter uma inicialização, ou serem inicializados no construtor

class AlgumaClasse1 {
  int umaDeclaracao = 0;
  int inicializandoFormal;
  int inicializaoDaList;
  //dessa forma que se inicializa uma variavel nulla dentro de uma classe com construtor

  //construtor
  AlgumaClasse1(this.inicializandoFormal) : inicializaoDaList = 0;
  //quando eu faço isso no construtor ': inicializaoDaList = 0; estou inicializando em forma de list !!
}

//====================================================================
//Parametros opcionais devem ter um valor Padrao(default)
//se eu nao passar nenhum valor para 'nome' ele assume o 'Vitor'
pessoa({String nome = 'Vitor'}) {}

//========
//resumindo uma String? pode receber uma String e um null
