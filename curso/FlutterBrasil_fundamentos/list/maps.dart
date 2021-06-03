//maps = chave e valor
//exemplo
//nome    Vitor
//Cidade  Rio preto

class InfoPesso {
  int idade;
  InfoPesso(
    this.idade,
  );
}

main() {
  Map<int, String> ddds = Map();
  ddds[17] = 'São josé do rio preto';
  ddds[19] = 'Campinas';
  ddds[11] = 'São paulo';

  //posso acessar as chaves
  print(ddds.keys);

  //posso acessar os valores
  print(ddds.values);

  //posso acessar chave e valores
  print(ddds.entries);
  //ou
  print(ddds);

  //posso remover uma key(chave)
  ddds.remove(11);

  Map<String, dynamic> pessoa = Map();
  //repare que o tipo dynamic utiliza todos os tipos !
  pessoa['Nome'] = 'Vitor';
  pessoa['idade'] = 28;
  pessoa['altura'] = 1.68;
  pessoa['peso'] = true;

  //Posso armazenar as informações da classe InfoPessoa em um map
  Map<String, InfoPesso> pessoas = Map();
  pessoas["Vitor"] = InfoPesso(28);
  pessoas["Gi"] = InfoPesso(21);
  pessoas["Ari"] = InfoPesso(1);
}
