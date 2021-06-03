import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
 
  List _itens = [];

  void _carregarItens(){

      //coloque essa list aqui tambem
      //pois quando damos hot realod a lista vai se duplicando pois colocamos a função antes do scaffold
      //para evitar colocamos a list aqui antes do FOR para ela zerar!
     

    for(int i=0; i <= 10; i++){
      Map<String, dynamic> item = Map();
      item['titulo'] = 'Título $i uma lista feita com map para pegar recursos da web se precisar';
      item['descricao'] = 'Descrição $i agora eu defino uma descrição que vai ficar em letras menores';

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
                title: Text('${ _itens[index]['titulo'] }'),
                subtitle: Text('${ _itens[index]['descricao'] }'),
              );
            }),
      ),
    );
  }
}
