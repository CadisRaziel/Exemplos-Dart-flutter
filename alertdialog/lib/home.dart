import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List _itens = [];

  void _carregarItens() {
    List _itens = [];

    for (int i = 0; i <= 10; i++) {
      Map<String, dynamic> item = Map();
      item['titulo'] =
          'Título $i uma lista feita com map para pegar recursos da web se precisar';
      item['descricao'] =
          'Descrição $i agora eu defino uma descrição que vai ficar em letras menores';

      //aqui eu adiciono o map que criei acima dentro da List _itens que esta com um array vazio!
      _itens.add(item);
    }
  }

  @override
  Widget build(BuildContext context) {
    _carregarItens();
    //OBS IMPORTANTE, sempre quando colocamos uma função de lista para ser exibida aqui
    //e damos um hot reaload, essa lista vai ficar se acumulando, para evitar isso de um RESTART
    //para evitar isso coloque a list vazia antes do FOR como coloquei la em cima

    return Scaffold(
      appBar: AppBar(title: Text('Lista')),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView.builder(
            //itemCount = definir a quantidade de itens (se eu colocar mais que 3 itens vai dar erro 'tente usar variavel.lenght aqui')
            itemCount: _itens.length,
            padding: EdgeInsets.all(15),
            //context é sempre passado como parametro, e o indice é o que vamos utilizar
            itemBuilder: (BuildContext context, index) {
              // print('Item ${ _itens[index]['titulo'] } ');
              return ListTile(
                //adicionando o alert (coloque um onTap ou onLongPress)
                onTap: () {
                  // print('Clique com onTap $index');
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('${_itens[index]['titulo']}'),
                          titlePadding: EdgeInsets.all(30),
                          titleTextStyle:
                              TextStyle(fontSize: 20, color: Colors.white),
                          content: Text('${_itens[index]['descricao']}'),
                          contentPadding: EdgeInsets.all(30),
                          contentTextStyle:
                              TextStyle(fontSize: 15, color: Colors.white),
                          backgroundColor: Colors.black,
                          actions: [
                            ElevatedButton(
                                onPressed: () {
                                  print('Selecionado Sim');
                                },
                                child: Text('Sim')),
                            ElevatedButton(
                                onPressed: () {
                                  print('Selecionado Não');
                                  //navigator.pop pois quando eu cliar no não ele vai fechar o dialog
                                  Navigator.pop(context);
                                },
                                child: Text('Não')),
                            Icon(
                              Icons.add_a_photo,
                              color: Colors.white,
                            )
                          ],
                        );
                      });
                },
                title: Text('${_itens[index]['titulo']}'),
                subtitle: Text('${_itens[index]['descricao']}'),
              );
            }),
      ),
    );
  }
}
