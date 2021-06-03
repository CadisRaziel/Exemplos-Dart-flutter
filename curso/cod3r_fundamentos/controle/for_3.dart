main() {
  //utilizando o FOR IN com o MAP
  //lembre-se definimos o map com um par de {}
  //num = aceita double e numeros inteiros
  Map<String, num> notas = {
    'Vitor': 10,
    'Gi': 8.5,
    'Ariella': 9.7,
    'Rosana': 7.0,
    'Monique': 6,
    'Michele': 5.9,
  };

  //metodos de pegar chave e valor
  //pegando as chaves e interpolando o valor
  for (String nome in notas.keys) {
    print("Nome do aluno é $nome e a nota é ${notas[nome]}");
    //repare que interpolei o valor em ${notas[nome]}
  }

  //pegando as chaves
  for (String nome in notas.keys) {
    print("O nome do aluno é $nome");
  }

  //pegando os valores
  for (num nota in notas.values) {
    print("A nota do aluno é $nota");
    //OBS: repare que no map eu coloquei como "NUM" então aqui eu devo especificar como num ou var !!
  }

  //pegando chaves e valores (usando o entries)
  for (var registro in notas.entries) {
    print("O ${registro.key} tem a nota ${registro.value}");
    //OBS: o entries me deixa pegar key e value usando a interpolação !!!
    //OBS: repare que coloquei var para ele identificar automaticamente as especificações usadas
  }
}
