//Mixins é uma forma de utilizar codigos em multiplas hierarquias de classes
//repare que nas interfaces nós estamos obrigando a passar o metodo quando colocamos implements
//ou seja as classes que recebem implements sao obrigadas a passar esse meotod que tem nela sem corpo
//agora se eu usar Mixins

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

mixin Escrita {
  void escreverArtigoJornal() {
    print('Escrever um artigo em Mixin');
  }
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

//utilizando os recursos do mixin
//repare que o Mixin ao invez de 'implements' ele usa 'with'
class Vitor1 extends Cidadao with Escrita {
  //imagine o seguinte, eu nao quero colocar um metodo dentro de Cidadao, quero que uma classe espeficia tenha ele
  //eu crio um mixin e coloco with !
  //com isso o Mixin adiciona esse trecho de codigo no Vitor1 (REPARE BEM ELE ADICIONA!)
  //no implements(interface) eu obrigo a classe a passar o metodo ao invez de adicionar apenas
  //repare que eu nao preciso por o metodo aqui dentro do Mixin
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

//Mixin = adicionar um trecho de codigo criado
//implements(interface) = obriga a dicionar o trecho de codigo de uma classe
