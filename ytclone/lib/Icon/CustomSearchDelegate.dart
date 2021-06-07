import 'package:flutter/material.dart';

//query = é tipo o .text ele captura o que o usuario esta digitando
//porém repare que nao precisamos de um controller pois dentro da classe SearchDelegate existe o query e nele tem um controller .text !
//esta tudo dentro do query

//coloquei uma <String> pois ele só vai aceitar um texto em string !
class CustomSearchDelegate extends SearchDelegate<String> {
  @override
  //buildActions = Widgets a serem exibidos após a consulta de pesquisa na AppBar
  //ou seja são acões que o usuario pode utilizar, como botão de fechar, botão de limpar etc..
  //vao aparecer do lado direito
  List<Widget> buildActions(BuildContext context) {
    //como é uma List eu tenho que usar os []
    return [
      IconButton(
          onPressed: () {
            //query captura o que esta sendo digitado
            query = '';
          },
          icon: Icon(Icons.clear)),
    ];
  }

  @override
  //buildLeading = Um widget a ser exibido antes da consulta atual no AppBar
  //ou seja ele coloca o botão de voltar !
  //vai aparecer do lado esquerdo
  Widget buildLeading(BuildContext context) {
    //repare que aqui não é uma list então não preciso por o []
    return IconButton(
        onPressed: () {
          //close vai fechar a tela (ja que quando clicamos no icone de pesquisa ele abre uma tela sobre a tela de inicio !)
          //coloque um valor vazio '' pois quando o usuario clicar para voltar ele vai voltar na homepage e nao vai dar um erro de null
          close(context, '');
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  //buildResults = Os resultados mostrados depois que o usuário envia uma pesquisa da página de pesquisa
  //apresenta os resultados da pesquisa
  Widget buildResults(BuildContext context) {
    Future.delayed(Duration.zero, () {
      close(context, query);
    });

    return Center(
      child: CircularProgressIndicator(),
    );
  }

  @override
  //buildSuggestions = Sugestões mostradas no corpo da página de pesquisa enquanto o usuário digita uma consulta no campo de pesquisa.
  //define sugestões de pesquisa (é chamado toda vez que o usuario digita algo)
  Widget buildSuggestions(BuildContext context) {
    List<String> lista = [];

    //verificando se o que o usuario digitou não esta vazio
    if (query.isNotEmpty) {
      //para filtrar o que o usuario digita exp: Android e logo em seguida ja aparece a continuação do android
      //eu pego diretamente da api e coloco aqui, porém aqui é só um exemplo statico
      lista = [
        'Fluterando', 'android', 'oogle', 'jogos', 'Aika online'
        //where para filtrar como se fosse um parametro de api
      ]
          .where((texto) => texto.toLowerCase().startsWith(query.toLowerCase()))
          .toList();
      return ListView.builder(
          itemCount: lista.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              onTap: () {
                //esse onTap é para sabermos qual sugestao ele criou para abrir o resultado
                close(context, lista[index]);
              },
              title: Text(lista[index]),
            );
          });
    } else {
      return Center(
          //vai aparecer ao centro da tela antes mesmo de clicar para pesquisar algo
          child: Text('Nenhum resultado para a pesquisa',
              style: TextStyle(
                fontSize: 18,
              )));
    }
  }
}

/*

Delegue para showSearch para definir o conteúdo da página de pesquisa.

A página de pesquisa sempre mostra um AppBar no topo, onde os usuários podem inserir suas consultas de pesquisa.
 Os botões mostrados antes e depois do campo de texto da consulta de pesquisa
  podem ser personalizados por meio de SearchDelegate.buildLeading e SearchDelegate.buildActions .
   Além disso, um widget pode ser colocado na parte inferior da AppBar via SearchDelegate.buildBottom .

O corpo abaixo do AppBar pode mostrar consultas sugeridas
 (retornadas por SearchDelegate.buildSuggestions ) ou - uma vez que o usuário envia uma pesquisa 
 - os resultados da pesquisa conforme retornados por SearchDelegate.buildResults .

SearchDelegate.query sempre contém a consulta atual inserida pelo usuário e deve ser usado para construir as sugestões e resultados.

Os resultados podem ser apresentados na tela chamando SearchDelegate.showResults
 e você pode voltar a mostrar as sugestões chamando SearchDelegate.showSuggestions .

Depois que o usuário seleciona um resultado de pesquisa, 
SearchDelegate.close deve ser chamado para remover a página de pesquisa do topo da pilha de navegação e notificar
 o chamador de showSearch sobre o resultado de pesquisa selecionado.

Um determinado SearchDelegate só pode ser associado a uma chamada showSearch ativa . 
Chame SearchDelegate.close antes de reutilizar a mesma instância de delegado para outra chamada showSearch .

*/
