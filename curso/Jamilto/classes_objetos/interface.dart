// Basicamente nós criamos uma interface e ela funciona como se fosse um contrato entre uma classe e outra.
// Então você já aprendeu sobre a relação de herança e nessa aula vamos aprender sobre a relação de uma
// classe com uma interface e a interface.
// Ela é utilizada pois podemos ter muitos objetos muitas classes que podem possuir a mesma ação.
// Métodos porém podem executá las de maneiras diferentes.
// Isso é muito comum na hora que nós estivermos criando os nossos apps.
// Algumas ações você terá que escrever para cada situação e então para cada ação específica você precisará
// escrever códigos diferentes.

//em outras linguagens deveriamos colocar 'interface' inicialmente
//porém no dart nao precisa
//criando uma interface \/
abstract class Presidenciavel {
  //essa é uma classe que tem interface, porém a primeira vista não vemos nada de especial nela
  //porém repare na hora de passarmos o metodo abaixo para outras classes
  //eu uso o termo 'implements'
  //com isso eu posso ter esse metodo participarEleicao() em todas as classes
  //porém o seu corpo {} sera diferente para cada uma
  void participarEleicao();
}

//mais uma classe interface
abstract class Jornalismo {
  void fazerJornal();
}

abstract class Cidadao {
  void direitoDeveres() {
    print('Todo cidadão tem direitos e deveres');
  }
}

//repare no implements Presidenciavel (isso é o interface)
class Obama extends Cidadao implements Presidenciavel {
  //aqui abaixo eu faço a reescreita do metodo da classe 'interface' Presidenciavel !!
  @override
  void participarEleicao() {
    print("Obama canditado a Presidente dos EUA");
  }
}

//veja aqui como podemos ter uma herança de mais de 2 interfaces
class Obama1 extends Cidadao implements Presidenciavel, Jornalismo {
  //aqui abaixo eu faço a reescreita do metodo da classe 'interface' Presidenciavel !!
  @override
  void participarEleicao() {
    print("Obama canditado a Presidente dos EUA");
  }

  @override
  void fazerJornal() {
    print('O Obama vai aparecer no jornal');
  }
}

class Vitor extends Cidadao {
  //repare que se eu nao colocar o implements essa classe nao tem interação nenhuma com a interface
  //assim nao precisando colocar o metodo !
}

//veja como passo a interface da classe Jornalismo
class VitorJornal implements Jornalismo {
  @override
  void fazerJornal() {
    print('O vitor esta fazendo a materia do jornal');
  }
}

main() {
  Obama barack = Obama();
  Vitor lendario = Vitor();
  VitorJornal jornalismo = VitorJornal();
  Obama1 duasInterface = Obama1();

  barack.direitoDeveres();
  barack.participarEleicao();

  lendario.direitoDeveres();

  jornalismo.fazerJornal();

  //olhe como podemos usar 2 interfaces
  duasInterface.fazerJornal();
  duasInterface.participarEleicao();
}

//resumindo
//eu crio uma classe abstract com um metodo sem corpo {}
//o metodo eu posso usar em outras classes que nao sao "FILHAS"
//porém eu devo declarar class Filhas implements Presidenciavel {}
//com isso dentro dessa classe vai ser obrigatorio a passar essa interface por causa do implements
//implements = contrato !

//é bom fazer isso pois o dart nao pode ter mais de 1 classe de herança
//ou seja podemos separar os metodos entre classes fazendo a interface
