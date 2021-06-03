// Parametro obrigatorio = ()
// Parametro opcional com valor por default = []
// Parametro opcional nomeado com valor por default = {}

//Obs: valor por default é o que eu coloco no parametro, exemplo: {int idade = 0}
//0 é o valor por default
//se o usuario nao colocar nenhum valor ele vai atribuir o valor por default que é 0

//parametro opcional
void exibirDados(String nome, [int idade = 0, double altura = 0.0]) {
  print("Nome: $nome");
  print("Idade: $idade");
  print("Altura: $altura");
}

//parametro opcional nomeado !
void exibirDados1(String nome, {int idade = 0, double altura = 0.0}) {
  print("Nome: $nome");
  print("Idade: $idade");
  print("Altura: $altura");
}

main() {
  exibirDados("Vitor");
  exibirDados1("Vitor", idade: 1, altura: 1.0);
}
