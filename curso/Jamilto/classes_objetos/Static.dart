class Config {
  static String identificadorApp = "ADB456DF";
  String notificacaoSom = "SIM";

  //imagine que eu tenho um metodo que tem que iniciar a config do meu metodo
  //posso fazer um static nele
  static void configInicial() {
    print("Executa config inicial");
  }
}
//Lembre-se o static parece ser mais simples e rapido do que instanciar a classe
//porém ele consome mais recursos !!! ou seja use somente quando precisar

main() {
  //Static e final

  //com o static eu nao preciso instanciar a classe !!!
  //posso passar o atributo da classe aqui diretamente !
  //é bom usar junto de classe abstract ou constantes
  Config.identificadorApp = 'Oi';
  print(Config.identificadorApp);

  Config.configInicial();
}
