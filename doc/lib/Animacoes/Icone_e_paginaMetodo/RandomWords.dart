//olha só que interessante nós componetizamos a classe RandomWords para apresenta-la no child acima
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class RandomWords extends StatefulWidget {
  const RandomWords({Key? key}) : super(key: key);

  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _sugestao = <WordPair>[];
  //Repare _save = <WordPair>{} = isso é um set (ou seja o set só tem valor e eles não podem ser repitidos)
  //ou seja o _save vai ter uma lista que vai pegar de WordPair e colocar me um set para não ter palavras repitidas
  final _save = <WordPair>{};
  final _fonts = const TextStyle(fontSize: 18);

  _buildRow(WordPair pair) {
    //o salvos é para garantir que uma palavra ainda não foi adicionado ao favorito
    final salvos = _save.contains(pair);
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _fonts,
      ),
      //nesse operador ternario tem a seguinte instrução
      //se salvos for adicionado ao favoritos coloque o icone de coração preenchido, se não coloque o icone de coração só com bordas
      //se salvos for adicionado aos favoritos adicione a cor vermelha nele, se não deixe nulo(vai ficar o coração com bordas)
      trailing: Icon(
        salvos ? Icons.favorite : Icons.favorite_border,
        color: salvos ? Colors.red : null,
      ),
      //aidiconando interatividade nos icones (ou seja para fazer o operador ternario neles)
      onTap: () {
        setState(() {
          if (salvos) {
            _save.remove(pair);
          } else {
            _save.add(pair);
          }
        });
      },
    );
  }

  _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: /*1*/ (context, i) {
          //isOdd = Retorna verdadeiro se somente este inteiro for ímpar
          if (i.isOdd) return const Divider(); /*2*/

          final index = i ~/ 2; /*3*/
          if (index >= _sugestao.length) {
            _sugestao.addAll(generateWordPairs().take(10)); /*4*/
          }
          return _buildRow(_sugestao[index]);
        });
  }


  //essa função cria uma nova pagina !!!
  void _pushSaved() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      final tilesMap = _save.map((WordPair pair) {
        //listTile coloca uma linha para separar as palavras
        return ListTile(
          title: Text(
            pair.asPascalCase,
            style: _fonts,            
          ),
        );
      });
      final divided = ListTile.divideTiles(
        context: context,
        tiles: tilesMap,
        //divideTiles vai por linhas igual o listTile separando as palavras, porém aqui consigo colocar cores nessas linhas
        color: Colors.red
      ).toList();

      return Scaffold(
        appBar: AppBar(
          title: Text('Palavras salvas <3'),
        ),
        body: ListView(
          children: divided,
        ),
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de palavras aleatórias'),
        actions: [IconButton(onPressed: _pushSaved, icon: Icon(Icons.list))],
      ),
      body: _buildSuggestions(),
    );
  }
}
