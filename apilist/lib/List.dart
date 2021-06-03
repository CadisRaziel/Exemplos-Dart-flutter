import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List _listaHorarios = ["10:30", "11:00", "13:00"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lista')),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView.builder(
            //itemCount = definir a quantidade de itens (se eu colocar mais que 3 itens vai dar erro 'tente usar variavel.lenght aqui')
            itemCount: 3,
            //context é sempre passado como parametro, e o indice é o que vamos utilizar
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 50,              
                child: Center(child: Text('Horarios ${_listaHorarios[index]}'),),
                // child: Center(child: Text('Horarios ${_listaHorarios.length}'),),
              );
            }),
      ),
    );
  }
}
