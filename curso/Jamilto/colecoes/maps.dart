//Maps = usado para armazenar itens

import 'dart:math';

main() {
  //chaves: ['MO'], valores: 'Morango'
  Map frutas = Map();
  frutas['MO'] = 'Morango';
  frutas['MA'] = 'Manga';
  print(frutas);

  //buscar por indice (customizado)
  Map frutas1 = Map();
  frutas1[0] = 'Melancia';
  frutas1[1] = 'Abacate';
  print(frutas1[0]);

  //especificando o tipo da chave e valor <>
  Map<int, String> estado = Map();
  estado[0] = "São Paulo";

  //especificando o tipo da chave e valor <>
  Map<String, String> estado1 = Map();
  estado1['SP'] = "São paulo";
  estado1['USA'] = "Estados unidos";
  print(estado1);

  //buscndo por indice
  print(estado1['USA']);

  //buscando pela chave
  print(estado1.keys);

  //buscando pelo valor
  print(estado1.values);

  //para saber se tem determinado elemento (posso buscar tanto por chave tanto por valor)
  print(estado1.containsKey('SP'));
  print(estado1.containsValue('Estados unidos'));

  //para saber quantos elementos tem na lista
  print(estado1.length);

  //percorrendo is itens = igual um for
  //vai apresentar como uma lista
  //posso exibir apenas 1 ou os 2 como no exemplo
  estado1.forEach((key, value) => print("$key - $value"));

  //criando map dynamic
  //colocando dynamic eu posso por um int, um double, uma string, um boolean que ele se transforma no elemento
  Map<String, dynamic> usuarios = Map();
  usuarios["nome"] = "Vitor";
  usuarios["idade"] = 28;
  usuarios["casdo"] = true;
  usuarios["altura"] = 1.69;

  //lembre-se Map<String, dynamic>
  //string sempre do lado esquerdo, dynamic sempre do lado direito
  //string chave (lado esquerdo)
  //dynamic valor (lado direito)
}

//repare que no Map tenhos indices customizados
//enquanto na list temos indices fixos 0 1 2 3 4 5 etc..
