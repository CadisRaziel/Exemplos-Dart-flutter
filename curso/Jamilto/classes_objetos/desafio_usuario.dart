class Usuario {
  //aqui fizemos um exemplo do porque utilizar uma classe
  //imagine uma sessao de login, a hora que o usuario for cadastrar o loguin e senha
  //a database vai conferir de tem ou nao esse usuario ja cadastrado(autenticado)
  //com isso ela faz as verificações no metodo autenticar

  String usuario = '';
  String senha = '';

  void autenticar() {
    //Recuperar de um banco de dados
    var usuario = "jamilton@gmail.com";
    var senha = "123456";

    //eu coloco this para acessar as variaveis fora desse metodo !!
    if (this.usuario == usuario && this.senha == senha) {
      print("Usuário autenticado");
    } else {
      print("Usuário não autenticado");
    }
  }
}

main() {
  Usuario usuario = Usuario();

  //Digitados pelo usuario do seu App
  usuario.usuario = "jamilton@gmail.com";
  usuario.senha = "12345";

  usuario.autenticar();
}
