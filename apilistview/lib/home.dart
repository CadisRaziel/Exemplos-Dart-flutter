//Future uma maneira melhorada(moderna) de fazer consumoWeb (api)
import 'package:apilistview/post.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<List<Post>?> _recuperarPostagem() async {
    http.Response response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var dadosJson = jsonDecode(response.body);

    List<Post> postagem = [];

    for (var post in dadosJson) {
      Post p = Post(post['userId'], post['id'], post['title'], post['body']);
      postagem.add(p);
    }

    return postagem;
  }

  @override
  Widget build(BuildContext context) {
    //repare que nao estamos usando nem Scaffold nem Container
    return Scaffold(
        appBar: AppBar(
          title: Text('Utilizando ListView.builder'),
          centerTitle: true,
        ),
        body: FutureBuilder<List<Post>?>(
          future: _recuperarPostagem(),
          //snapshot = sao os dados que recuperamos ao fazer a requisição
          builder: (context, AsyncSnapshot snapshot) {
            //coneectionnState = para saber se deu certo ou não
            switch (snapshot.connectionState) {
              case ConnectionState.none:

              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              case ConnectionState.active:

              case ConnectionState.done:
                if (snapshot.hasError)
                  return Text('Error: ${snapshot.error}');
                else
                  return Scaffold(
                    backgroundColor: Colors.white,
                    body: Container(                        
                        child: ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, index) {

                              List<Post> lista = snapshot.data;
                              Post post = lista[index];                             

                              return ListTile(
                                title: Text(post.title),
                                subtitle: Text(post.id.toString()),
                              );
                            }
                            )
                            ),
                  );
            }
          },
        ));
  }
}

//ConnectionState.none = status de conexão é nullo
//ConnectionState.waiting = aguardando os dados serem recuperados (imagine que demora 5 segundos, ele se mantem no estado waiting.)
//ConnectionState.active = utilizado mais para stream (conexao mantem ativa)
//ConnectionState.done = terminou de fazer o processo de recuperação dos dados

/*
O AsyncSnapshot possui propriedades que nos ajudam - E MUITO - a entender o que está acontecendo durante a requisição e tratar isso,
por exemplo: Saber se ocorreu algum erro (hasError) ou se o retorno contém dados de fato (hasData)
*/
