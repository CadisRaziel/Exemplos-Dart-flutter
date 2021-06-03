class Usuario {
  String usuario = '';
  String senha = '';
  String cargo = '';

  //construtor padrao
  Usuario(
    this.usuario,
    this.senha,
    //posso por um print("configuraçoes iniciais do objeto"); para por alguma mensagem
  );

  //construtor nomeado (usaro para fazer coisas especificas)
  //posso fazer assim passando só o usuario e senha
  //Usuario.nomeConstrutor(this.usuario, this.senha);

  //ou posso fazer assim passando valor dentro dele
  Usuario.nomeConstrutor(this.usuario, this.senha) {
    this.cargo = 'Diretor';
    print("Privilegio liberado para o $cargo");
  }

  void autenticar() {
    var usuario = "jamilton@gmail.com";
    var senha = "123456";

    if (this.usuario == usuario && this.senha == senha) {
      print("Usuário autenticado");
    } else {
      print("Usuário não autenticado");
    }
  }
}

main() {
  //o construtor faz com que eu possa passar o usuario e senha diretamente aqui no Usuario()
  //ou seja eu posso fazer isso Usuario('jamilton@gmail.com', '12345');
  //evitando ficar escrevendo variaveis como abaixo
  //antes do construtor
  // Usuario usuario = Usuario();
  // usuario.usuario = "jamilton@gmail.com";
  // usuario.senha = "12345";

  //depois do construtor
  Usuario usuario = Usuario("jamilton@gmail.com", "123456");
  usuario.autenticar();

  //obs eu posso tanto fazer o construtor como o .. para facilitar
  //o exemplo do .. esta na aula classes_objetos

  //usando o construtor nomeado
  Usuario usuarioDiretor =
      Usuario.nomeConstrutor("jamilton@gmail.com", "12345");
  usuarioDiretor.autenticar();
}
