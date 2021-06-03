//classe
class Casa {
  //aqui dentro conseguimos definir:
  //atributos = caracteristicas da casa
  String cor = '';

  //metodos = o que a casa pode fazer
  void abrirJanela(int qtdJanelas) {
    print("abri as $qtdJanelas janelas.");
    print("a cor das janelas são $cor");
  }

  //veja como podemos passar um metodo para dentro de outro metodo
  void abrirPorta() {
    print("Abrir a porta da casa $cor");
  }

  void abrirCasa() {
    //para que esse metodo receba um metodo criado dentro dessa classe eu utilizo o 'this'
    this.abrirPorta();
  }
}

main() {
  //objeto
  Casa minhacasa = Casa();
  minhacasa.cor = 'Branca';
  minhacasa.abrirJanela(5);
  print(minhacasa.cor);

  //posso usar o mesmo objeto para criar diversar outros objetos com caracteristicas diferentes
  //REPARE NISSO, eu posso nao colcoar o ; quando eu termino o Casa() e colocar ..cor = 'azul';
  //com isso .. eu nao preciso rescrever a varaivel !!!
  Casa minhacasa2 = Casa()..cor = 'azul';
  minhacasa2.abrirJanela(2);
  print(minhacasa2.cor);

  //como eu coloquei um metodo dentro do outro
  //quando eu chamo o metodo principal aqui
  //ele vai executar os 2 metodos de uma só vez !!
  minhacasa2.abrirCasa();
}
