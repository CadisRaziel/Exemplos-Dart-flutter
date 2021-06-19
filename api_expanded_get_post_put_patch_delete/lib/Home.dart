import 'dart:convert';

import 'package:api_expanded/core/network.dart';
import 'package:api_expanded/core/post.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Post = CRIAR
  Future<List<Post>?> _post() async {
    String url = 'https://jsonplaceholder.typicode.com/posts';

    //precisamos passar o body em formato string
    //por isso usamos o jsonEncode = recebe um objeto json e retorna ele como uma string
    var corpo = jsonEncode({
      "userId": 120,
      "id": null,
      "title": "Titulo",
      "body": "Corpo da postagem"
    });

    http.Response response = await http.post(Uri.parse(url),
        headers: {'Content-type': 'application/json; charset=UTF-8'},
        body: corpo);

    print('Resposta: ${response.statusCode}');
    print('Resposta: ${response.body}');
  }

  //Put = Altera todos os dados do objeto json por isso tem que ser alterado todos sem ter null (o null ali é só para teste)(ou seja pra isso precisamos enviar o objeto inteiro no jsonEnconde)
  Future<List<Post>?> _put() async {
    String url = 'https://jsonplaceholder.typicode.com/posts/2';

    //precisamos passar o body em formato string
    //por isso usamos o jsonEncode = recebe um objeto json e retorna ele como uma string
    var corpo = jsonEncode({
      "userId": 120,
      "id": null,
      "title": "Titulo alterado",
      "body": "Corpo da postagem alterado"
    });

    http.Response response = await http.put(Uri.parse(url),
        headers: {'Content-type': 'application/json; charset=UTF-8'},
        body: corpo);

    print('Resposta: ${response.statusCode}');
    print('Resposta: ${response.body}');
  }

  //Patch = atualiza um item em especifico (ou seja nao precisa enviar o objeto inteiro no jsonEncode)
  Future<List<Post>?> _patch() async {
    String url = 'https://jsonplaceholder.typicode.com/posts/2';

    //precisamos passar o body em formato string
    //por isso usamos o jsonEncode = recebe um objeto json e retorna ele como uma string
    var corpo = jsonEncode({
      "userId": 120,
      //repare que nao preciso por todos os itens do objeto quando é patch
      // "id": null,
      // "title": null,
      "body": "Corpo da postagem alterado no patch"
    });

    http.Response response = await http.patch(Uri.parse(url),
        headers: {'Content-type': 'application/json; charset=UTF-8'},
        body: corpo);

    print('Resposta: ${response.statusCode}');
    print('Resposta: ${response.body}');
  }

  //Detele = remove o objeto
  Future<List<Post>?> _delete() async {
    String url =
        'https://jsonplaceholder.typicode.com/posts/2'; //estamos usando essa ulr post/2 pois no site placeholder esta assim no Delete;

    //o delete é o mais simples e o que usa pouco código
    http.Response response = await http.delete(Uri.parse(url));
    if (response.statusCode == 200) {
      print('Sucesso');
      print('Resposta: ${response.body}');
    } else {
      print('Erro ao capturar os dados');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Requisição Post e Expanded'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _post();
                      });
                    },
                    child: Text('Salvar')),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      // _put();
                      _patch();
                    });
                  },
                  child: Text('Atualizar'),
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _delete();
                      });
                    },
                    child: Text('Remover')),
              ],
            ),
            Expanded(
              child: FutureBuilder(
                future: fetchPhoto(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Text(snapshot.data[index].title),
                          subtitle: Text(snapshot.data[index].body),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Container(
                      child: Center(
                        child: Text('Not Found data'),
                      ),
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//Repare nesse exemplo, temos um widget que é um botão
//e temos a api que retorna o post titulo e body
//se eu nao colocar o expanded, ele não vai apresentar a lista e da um erro de espaço !!!
//por isso quando tivermos mais de 1 widget na mesma tela, colocamos Expanded para gerenciar os espaços entre eles
